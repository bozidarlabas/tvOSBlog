//
//  LoadingView.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 30.11.2023..
//

import UIKit

class LoadingView: UIView {
    
    private var spinner: UIActivityIndicatorView!
    private let textLabel = Heading2Label()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        if #available(tvOS 13.0, *) {
            spinner = UIActivityIndicatorView(style: .medium)
        } else {
            spinner = UIActivityIndicatorView()
        }
        
        addSubview(spinner)
        addSubview(textLabel)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        dropShadow(offSet: CGSize(width: 0, height: 6), radius: 12, shadowOpacity: 0.5)
        
        alpha = 0
        textLabel.textAlignment = .center
        spinner.color = .black
        spinner.hidesWhenStopped = true
        isHidden = true
    }
    
    // Setters for the spinner and text
    func setText(_ text: String) {
        textLabel.text = text
        textLabel.textColor = UIColor.black
    }
    
    func startAnimating() {
        animate(isHidden: false)
        spinner.startAnimating()
    }
    
    func stopAnimating() {
        animate(isHidden: true)
        spinner.stopAnimating()
    }
    
    override func didMoveToSuperview() {
        setAutolayout()
    }
    
    func setAutolayout() {
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            
            spinner.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            textLabel.topAnchor.constraint(equalTo: spinner.bottomAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
        ])
    }
}

