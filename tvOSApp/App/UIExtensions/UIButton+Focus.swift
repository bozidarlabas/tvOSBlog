//
//  UIButton+Focus.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 30.11.2023..
//

import UIKit

extension UIButton {
    
    func setNormalColor(_ color: UIColor) {
        let image = UIImage.imageWithColor(color)
        setBackgroundImage(image, for: .normal)
    }
    
    func setFocusedColor(_ color: UIColor) {
        let image = UIImage.imageWithColor(color)
        setBackgroundImage(image, for: .focused)
    }
    
    func setHighlightedColor(_ color: UIColor) {
        let image = UIImage.imageWithColor(color)
        setBackgroundImage(image, for: .highlighted)
    }
    
}

extension UIImage {
    static func imageWithColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
