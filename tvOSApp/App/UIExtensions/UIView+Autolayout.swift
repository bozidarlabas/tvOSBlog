//
//  UIView+Autolayout.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 30.11.2023..
//

import UIKit

extension UIView {
    
    func asSubview<T: UIView>(localizedTitle: String? = nil, imageName: String? = nil, uppercased: Bool = false) -> T {
        let view = T()
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        var title = localizedTitle
        if uppercased {
            title = title?.uppercased()
        }
        if let localizedTitle = title {
            if let label = view as? UILabel {
                label.text = localizedTitle
            } else if let button = view as? UIButton {
                button.setTitle(localizedTitle, for: .normal)
            } else if let textField = view as? UITextField {
                textField.placeholder = title
            }
        } else if let imageName = imageName {
            if let imageView = view as? UIImageView {
                imageView.image = UIImage(named: imageName)
            }
        }
        return view
    }
    
}
