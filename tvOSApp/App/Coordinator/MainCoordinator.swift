//
//  MainCoordinator.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 30.11.2023..
//

import UIKit

class MainCoordinator: MainCoordinatorProtocol {
    
    
    private var window: UIWindow
    var navigation: UINavigationController = UINavigationController()
    
    
    init(window: UIWindow) {
        self.window = window
        presentInWindow()
    }
    
    func start() {
        navigation.isNavigationBarHidden = true
        presentLoginScreen()
    }
    
    func presentLoginScreen() {
//        let loginPresenter = LoginPresenter(coordinator: self)
//        let viewController = LoginViewController(presenter: loginPresenter)

        let viewController = Example1ViewController()
        navigation.setViewControllers([viewController], animated: true)
    }
    
    // Sets the root view controller to the navigation controller
    private func presentInWindow() {
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}
