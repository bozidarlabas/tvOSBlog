//
//  UIView+AutolayoutConstraints.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 30.11.2023..
//

import UIKit

enum Edge {
    case top
    case bottom
    case left
    case right
    case none
}

extension UIView {
    func pinToAllEdges(horizontalMargin: CGFloat = 0, verticalMargin: CGFloat = 0, excludingEdge: Edge = .none) {
        guard let superview = superview else { return }
        if translatesAutoresizingMaskIntoConstraints == true {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        if excludingEdge != .top {
            topAnchorToSuperview(constant: verticalMargin)
        }
        
        if excludingEdge != .bottom {
            bottomAnchorToSuperview(constant: verticalMargin)
        }
        
        if excludingEdge != .left {
            leadingAnchorToSuperview(constant: horizontalMargin)
        }
        
        if excludingEdge != .right {
            trailingAnchorToSuperview(constant: horizontalMargin)
        }
    }
    
    func leadingAnchorToSuperview(constant: CGFloat = 0, priority: UILayoutPriority? = nil) {
        let constant = leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: constant)
        if let priority = priority {
            constant.priority = priority
        }
        constant.isActive = true
    }
    
    func leadingAnchorToSuperviewGT(constant: CGFloat = 0) {
        leadingAnchor.constraint(greaterThanOrEqualTo: superview!.leadingAnchor, constant: constant).isActive = true
    }
    
    func leadingAnchorToView(_ view: UIView, constant: CGFloat = 0) {
        leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant).isActive = true
    }
    
    func leadingAnchorToLeadingOfView(_ view: UIView, constant: CGFloat = 0) {
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
    }
    
    @discardableResult
    func trailingAnchorToSuperview(constant: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        let constraint = trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -constant)
        constraint.isActive = true
        if let priority = priority {
            constraint.priority = priority
        }
        return constraint
    }
    
    func trailingAnchorToView(_ view: UIView, constant: CGFloat = 0) {
        trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -constant).isActive = true
    }
    
    func trailingAnchorToViewLS(_ view: UIView, constant: CGFloat = 0) {
        trailingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: -constant).isActive = true
    }
    
    func trailingAnchorToViewGT(_ view: UIView, constant: CGFloat = 0) {
        trailingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: constant).isActive = true
    }
    
    func trailingAnchorToTrailingOfView(_ view: UIView, constant: CGFloat = 0) {
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
    }
    
    func horizontalAnchors(constant: CGFloat = 0) {
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -constant),
            leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: constant),
        ])
    }
    
    func topAnchorToSuperview(constant: CGFloat = 0) {
        topAnchor.constraint(equalTo: superview!.topAnchor, constant: constant).isActive = true
    }
    
    func topAnchorToView(_ view: UIView, constant: CGFloat = 0) {
        topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
    }
    
    func topAnchorToTopOfView(_ view: UIView, constant: CGFloat = 0) {
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    
    func bottomAnchorToSuperview(constant: CGFloat = 0) {
        bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -constant).isActive = true
    }
    
    func bottomAnchorToView(_ view: UIView, constant: CGFloat = 0) {
        bottomAnchor.constraint(equalTo: view.topAnchor, constant: -constant).isActive = true
    }
    
    func bottomAnchorToViewLS(_ view: UIView, constant: CGFloat = 0) {
        bottomAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: -constant).isActive = true
    }
    
    func bottomAnchorToBottomOfView(_ view: UIView, constant: CGFloat = 0) {
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
    }
    
    func centerYAnchorToSuperview(constant: CGFloat = 0) {
        centerYAnchor.constraint(equalTo: superview!.centerYAnchor, constant: constant).isActive = true
    }
    
    func centerXAnchorToSuperview(constant: CGFloat = 0) {
        centerXAnchor.constraint(equalTo: superview!.centerXAnchor, constant: constant).isActive = true
    }
    
    func centerYAnchorToView(view: UIView, constant: CGFloat = 0) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
    func centerxAnchorToView(view: UIView, constant: CGFloat = 0) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }
    
    // greaterThanOrEqualTo
    @discardableResult
    func leadingAnchorToViewGT(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    // greaterThanOrEqualTo
    @discardableResult
    func leadingAnchorToViewsTrailingGT(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = leadingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    // lessThanOrEqualTo
    @discardableResult
    func trailingAnchorToSuperViewLS(constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = trailingAnchor.constraint(lessThanOrEqualTo: superview!.trailingAnchor, constant: -constant)
        constraint.isActive = true
        return constraint
    }
    
    func height(_ constant: CGFloat)  {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func equalWidthTo(_ view: UIView)  {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func equalHeightTo(_ view: UIView)  {
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func width(_ constant: CGFloat) {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func widthLessThanOrEqualToSuperview(multiplier: CGFloat = 1) {
        widthAnchor.constraint(lessThanOrEqualTo: superview!.widthAnchor, multiplier: multiplier).isActive = true
    }

}

