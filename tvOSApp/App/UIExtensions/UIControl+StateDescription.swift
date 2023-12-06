//
//  UIControl+StateDescription.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 06.12.2023..
//

import UIKit

extension UIControl {
    
    var stateDescription: String {
        let stateString: String
        switch state {
        case .normal:
            stateString = "Normal"
        case .focused:
            stateString = "Focused"
        default:
            stateString = "Unknown"
        }

        return stateString
        
    }
}
