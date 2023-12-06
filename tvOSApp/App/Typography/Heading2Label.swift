//
//  Heading2Label.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 30.11.2023..
//

import UIKit

class Heading2Label: UILabel {
    
    var color: UIColor = .white {
        didSet {
            textColor = color
        }
    }
    
    var alignment: NSTextAlignment = .left {
        didSet {
            textAlignment = alignment
        }
    }

    override var text: String? {
        get {
            return super.text
        }
        set {
            super.text = newValue
            styleViews()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        styleViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        styleViews()
    }
    
    func styleViews() {
        styleHeading2Label(alignment: alignment, color: color)
    }
}
