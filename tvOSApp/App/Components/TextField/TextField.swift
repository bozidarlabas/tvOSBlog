//
//  TextField.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 30.11.2023..
//

import UIKit

class TextField: UITextField {
    let inset: CGFloat = 10

    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRectInset(bounds , inset , inset)
    }

    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRectInset(bounds , inset , inset)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, inset, inset)
    }
}

