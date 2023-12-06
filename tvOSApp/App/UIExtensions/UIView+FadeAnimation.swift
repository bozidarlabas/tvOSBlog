//
//  UIView+FadeAnimation.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 30.11.2023..
//

import UIKit

extension UIView {
    
    public static let defaultFadingAnimationDuration: TimeInterval = 0.3

    public func animate(isHidden: Bool, duration: TimeInterval = UIView.defaultFadingAnimationDuration, completion: ((Bool) -> Void)? = nil) {
        if isHidden {
            fadeOut(duration: duration,
                    completion: completion)
        } else {
            fadeIn(duration: duration,
                   completion: completion)
        }
    }

    public func fadeOut(duration: TimeInterval = UIView.defaultFadingAnimationDuration, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration,
                       animations: {
                           self.alpha = 0.0
                       },
                       completion: { isFinished in
                           self.isHidden = isFinished

                           completion?(isFinished)
        })
    }

    public func fadeIn(duration: TimeInterval = UIView.defaultFadingAnimationDuration, completion: ((Bool) -> Void)? = nil) {
        if isHidden {
            isHidden = false
        }

        UIView.animate(withDuration: duration,
                       animations: {
                           self.alpha = 1.0
                       },
                       completion: completion)
    }
}

