//
//  UIView+Gradient.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 01.12.2023..
//

import UIKit

extension UIView {
    func setGradientBackground(topLeftColor: UIColor, bottomRightColor: UIColor) {
//        // Create a gradient layer
//        let gradientLayer = CAGradientLayer()
//
//        // Define the colors for the gradient
//        gradientLayer.colors = [topLeftColor.cgColor, bottomRightColor.cgColor]
//
//        // Define the start and end points for the gradient (top-left to bottom-right)
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//
//        // Set the frame of the gradient layer to match the frame of the view
//        gradientLayer.frame = bounds
//
//        // Remove any existing sublayers (e.g., if you call this method multiple times)
//        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
//
//        // Add the gradient layer to the view's layer
//        layer.insertSublayer(gradientLayer, at: 0)
        
        let gradientLayer = CAGradientLayer()
                // 1
//                self.backgroundColor = ColorPalette.White

                // 2
                gradientLayer.frame = self.bounds

                // 3
                let color1 = topLeftColor.cgColor
                let color2 = bottomRightColor.cgColor
                gradientLayer.colors = [color1, color2]

                //** This code should do the trick... **//
                gradientLayer.startPoint = CGPointMake(0.0, 0.5)

                // 4
                gradientLayer.locations = [0.0, 1.0]

                // 5
                self.layer.addSublayer(gradientLayer)
        
    }
}
