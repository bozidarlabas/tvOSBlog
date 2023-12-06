//
//  Example1ViewController.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 01.12.2023..
//

import UIKit

class Example1ViewController: UIViewController {

    var container: UIView!
    var selectedText: Heading2Label!
    var stateLabel: Heading2Label!
    var selectedContainer: UIView!
    var remoteImageView: UIImageView!
    var secondRemoteImageView: UIImageView!
    var remoteCircleButton: UIView!
    var remoteArrowRightButton: UIView!
    var remoteArrowLeftButton: UIView!
    var remoteArrowTopButton: UIView!
    var remoteArrowBottomButton: UIView!
    var nextButton: FocusedButton!
    
    var verticalStackView: UIStackView!
    var buttons: [FocusedButton] = []
    let numberOfColumns = 3
    let numberOfRows = 2
    
//    override var preferredFocusEnvironments: [UIFocusEnvironment] {
//        return [remoteCircleButton]
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        
        if let lastButton = buttons.last {
            addFocusGuide(from: lastButton, to: nextButton, direction: .right, debugMode: true)
            addFocusGuide(from: nextButton, to: lastButton, direction: .left, debugMode: true)
        }
        
        for (index, button) in buttons.enumerated() {
            let isLast = index == buttons.count - 1
            if !isLast {
                button.alpha = 0
            }
        }
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesBegan(presses, with: event)
        buttons.filter { $0.isHighlighted }
            .forEach { $0.setTitle("Highlighted", for: .normal) }
        if nextButton.isHighlighted {
            nextButton.setTitle("Highlighted", for: .normal)
        }
        
        for item in presses {
            if item.type == .select {
                remoteCircleButton.isHidden = false
            } else if item.type == .rightArrow {
                remoteArrowRightButton.isHidden = false
            } else if item.type == .leftArrow {
                remoteArrowLeftButton.isHidden = false
            } else if item.type == .upArrow {
                remoteArrowTopButton.isHidden = false
            } else if item.type == .downArrow {
                remoteArrowBottomButton.isHidden = false
            }
        }
    }
    
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesEnded(presses, with: event)
        buttons.forEach { $0.setTitle($0.stateDescription, for: .normal) }
        nextButton.setTitle(nextButton.stateDescription, for: .normal)

        if presses.contains(where: { $0.type == .select }) {
            remoteCircleButton.isHidden = true
        } else if presses.contains(where: { $0.type == .rightArrow }) {
            remoteArrowRightButton.isHidden = true
        } else if presses.contains(where: { $0.type == .leftArrow }) {
            remoteArrowLeftButton.isHidden = true
        } else if presses.contains(where: { $0.type == .upArrow }) {
            remoteArrowTopButton.isHidden = true
        } else if presses.contains(where: { $0.type == .downArrow }) {
            remoteArrowBottomButton.isHidden = true
        }
    }
    
}
