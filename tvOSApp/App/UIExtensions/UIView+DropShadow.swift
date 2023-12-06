//
//  UIView+DropShadow.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 30.11.2023..
//

import UIKit

extension UIView {

    func dropShadow(
        color: UIColor = .black,
        offSet: CGSize = CGSize(width: 5, height: 4),
        radius: CGFloat = 5,
        shadowOpacity: Float = 0.3) 
    {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
    }
    
    func addShadowWithClipToBounds(
        color: UIColor = .black,
        offSet: CGSize = CGSize(width: 5, height: 4),
        radius: CGFloat = 5,
        shadowOpacity: Float = 0.3)
    {
        self.layer.cornerRadius = 40

        let shadowPath2 = UIBezierPath(rect: self.bounds)

        self.layer.masksToBounds = false

        self.layer.shadowColor = UIColor.red.cgColor

        self.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))

        self.layer.shadowOpacity = 0.5

        self.layer.shadowPath = shadowPath2.cgPath
    }

}
