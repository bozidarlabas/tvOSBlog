//
//  FocusedButton.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 30.11.2023..
//

import UIKit

class FocusedButton: UIButton {
    
    var setBorder: Bool = false
    var borderWidth: CGFloat = 1
    var borderColor: UIColor = .white
    var reactToFocus: Bool = true
    var focusedScale: CGFloat = 1.2
    var focusedTitleColor: UIColor? = nil
    var highlightedTitleColor: UIColor? = nil
    var focusedBorderColor: UIColor?
    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 25.0
    private var fillColor: UIColor = .blue
    
    var changeShadowOnFocus: Bool = false {
        didSet {
            if changeShadowOnFocus {
                dropShadow()
                layer.shadowColor = UIColor.clear.cgColor
            }
        }
    }

    var titleColor: UIColor? = nil {
        didSet {
            setTitleColor(titleColor, for: .normal)
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            guard let highlightedTitleColor = highlightedTitleColor else { return }

            if isHighlighted {
                setTitleColor(highlightedTitleColor, for: .normal)
            } else {
                if let focusedTitleColor = focusedTitleColor, isFocused {
                    setTitleColor(focusedTitleColor, for: .normal)
                } else {
                    setTitleColor(titleColor, for: .normal)
                }
            }
        }
    }
    
    override var canBecomeFocused: Bool {
        return true
    }
    
    init(setBorder: Bool) {
        self.init()
        self.setBorder = setBorder
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        if setBorder {
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor.cgColor
        }
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView == self {
            handleFocusedButton(context: context)
        }
        
        if context.previouslyFocusedView == self {
            handleNormalButton(context: context)
        }
    }
    
    func handleFocusedButton(context: UIFocusUpdateContext) {
        if changeShadowOnFocus {
            self.layer.shadowColor = UIColor.black.cgColor
        }
        if let focusedTitleColor = focusedTitleColor {
            self.setTitleColor(focusedTitleColor, for: .normal)
        }
        if !reactToFocus && setBorder {
            self.layer.borderWidth = 0
            self.layer.borderColor = UIColor.clear.cgColor
        }
        guard reactToFocus else { return }
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            context.nextFocusedView?.transform = CGAffineTransformMakeScale(focusedScale, focusedScale)
            if self.setBorder, let focusedBorderColor = focusedBorderColor {
                self.layer.borderWidth = borderWidth
                self.layer.borderColor = focusedBorderColor.cgColor
            } else if self.setBorder {
                self.layer.borderWidth = 0
                self.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
    
    func handleNormalButton(context: UIFocusUpdateContext) {
        if changeShadowOnFocus {
            self.layer.shadowColor = UIColor.clear.cgColor
        }
        if let titleColor = titleColor {
            setTitleColor(titleColor, for: .normal)
        }
        
        if !reactToFocus && setBorder {
            self.layer.borderWidth = self.borderWidth
            self.layer.borderColor = self.borderColor.cgColor
        }
        guard reactToFocus else { return }
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            context.previouslyFocusedView?.transform = CGAffineTransformMakeScale(1.0, 1.0)
            if self.setBorder {
                self.layer.borderWidth = 1
                self.layer.borderColor = self.borderColor.cgColor
            }
        }
    }
    
}
