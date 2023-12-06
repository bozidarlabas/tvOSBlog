//
//  AppDelegate.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 30.11.2023..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var coordinator: MainCoordinatorProtocol!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        initialSetup()
        return true
    }

    private func initialSetup() {
        coordinator = MainCoordinator(window: window!)
        coordinator.start()
    }

}

