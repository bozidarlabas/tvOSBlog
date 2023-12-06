//
//  UILabel+Design.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 30.11.2023..
//

import UIKit

extension UILabel {
    
    func styleHeading2Label(alignment: NSTextAlignment = .left, color: UIColor = .white) {
        font = UIFont.systemFont(ofSize: 25)
        textColor = color
        textAlignment = alignment
    }

}
