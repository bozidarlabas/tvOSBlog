//
//  Example1ViewController+Design.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 01.12.2023..
//

import Foundation

import UIKit

extension Example1ViewController: ConstructViewsProtocol  {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        view.setGradientBackground(topLeftColor: "#1f2937".hexStringToUIColor(), bottomRightColor: "#312e81".hexStringToUIColor())

        view.backgroundColor = .white
        verticalStackView = view.asSubview()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 30
        buttons = []
        for _ in 0..<numberOfRows {
            let horizontalStackView = UIStackView()
            horizontalStackView.axis = .horizontal
            horizontalStackView.spacing = 30
            for _ in 0..<numberOfColumns {
                let button = createButton()
                horizontalStackView.addArrangedSubview(button)
            }
            verticalStackView.addArrangedSubview(horizontalStackView)
        }
        
        remoteImageView = view.asSubview(imageName: Images.remote)
        remoteImageView.isHidden = true
        
        remoteCircleButton = remoteImageView.asSubview()
        remoteCircleButton.isHidden = true
        
        remoteArrowRightButton = remoteImageView.asSubview()
        remoteArrowRightButton.isHidden = true
        
        remoteArrowLeftButton = remoteImageView.asSubview()
        remoteArrowLeftButton.isHidden = true
        
        remoteArrowTopButton = remoteImageView.asSubview()
        remoteArrowTopButton.isHidden = true
        
        remoteArrowBottomButton = remoteImageView.asSubview()
        remoteArrowBottomButton.isHidden = true
        
        nextButton = view.asSubview()
    }
    
    private func createButton() -> FocusedButton {
        let button = FocusedButton()
        styleButton(button)
        button.width(150)
        button.height(120)
        buttons.append(button)
        return button
    }
    
    private func styleButton(_ button: FocusedButton) {
        let focusedColor: UIColor = .grayLight
        button.setHighlightedColor("f3f3f3".hexStringToUIColor().withAlphaComponent(0.2))
        button.setNormalColor(focusedColor)
        button.setFocusedColor("f3f3f3".hexStringToUIColor())
        button.changeShadowOnFocus = true
        button.titleColor = .white
        button.highlightedTitleColor = .white
        button.setTitle("Normal", for: .normal)
        button.focusedTitleColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
    }
    
    func styleViews() {
        styleRemoteButton(remoteCircleButton)
        remoteCircleButton.layer.cornerRadius = 40
        
        styleRemoteButton(remoteArrowRightButton)
        remoteArrowRightButton.layer.cornerRadius = 12.5
        
        styleRemoteButton(remoteArrowLeftButton)
        remoteArrowLeftButton.layer.cornerRadius = 12.5
        
        styleRemoteButton(remoteArrowTopButton)
        remoteArrowTopButton.layer.cornerRadius = 12.5
        
        styleRemoteButton(remoteArrowBottomButton)
        remoteArrowBottomButton.layer.cornerRadius = 12.5
        
        remoteImageView.contentMode = .scaleAspectFit

        styleButton(nextButton)
    }
    
    private func styleRemoteButton(_ view: UIView) {
        view.backgroundColor = .white.withAlphaComponent(0.5)
        view.clipsToBounds = true
    }
    
    func defineLayoutForViews() {
        // Horizontal stack view
        verticalStackView.topAnchorToSuperview(constant: 50)
        verticalStackView.leadingAnchorToSuperview(constant: 50)
        
        remoteImageView.topAnchorToTopOfView(verticalStackView)
        remoteImageView.leadingAnchorToView(verticalStackView, constant: 50)
        remoteImageView.height(600)
        
        // Remote middle button
        remoteCircleButton.width(80)
        remoteCircleButton.height(80)
        remoteCircleButton.topAnchorToSuperview(constant: 83)
        remoteCircleButton.centerXAnchorToSuperview(constant: -2)
        
        // Remote right arrow button
        remoteArrowRightButton.width(25)
        remoteArrowRightButton.height(25)
        remoteArrowRightButton.centerYAnchorToView(view: remoteCircleButton, constant: 2)
        remoteArrowRightButton.leadingAnchorToView(remoteCircleButton, constant: 2)
        
        // Remote left arrow button
        remoteArrowLeftButton.width(25)
        remoteArrowLeftButton.height(25)
        remoteArrowLeftButton.centerYAnchorToView(view: remoteCircleButton, constant: 2)
        remoteArrowLeftButton.trailingAnchorToView(remoteCircleButton, constant: 2)
        
        // Remote top arrow button
        remoteArrowTopButton.width(25)
        remoteArrowTopButton.height(25)
        remoteArrowTopButton.centerxAnchorToView(view: remoteCircleButton, constant: 2)
        remoteArrowTopButton.bottomAnchorToView(remoteCircleButton, constant: 4)
        
        // Remote bottom arrow button
        remoteArrowBottomButton.width(25)
        remoteArrowBottomButton.height(25)
        remoteArrowBottomButton.centerxAnchorToView(view: remoteCircleButton, constant: 2)
        remoteArrowBottomButton.topAnchorToView(remoteCircleButton, constant: 4)
        
        // Next button
        nextButton.bottomAnchorToBottomOfView(remoteImageView)
        nextButton.leadingAnchorToView(remoteImageView, constant: 50)
        nextButton.width(150)
        nextButton.height(120)
    }
    
}
