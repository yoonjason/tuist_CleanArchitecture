//
//  AppDelegate.swift
//  ProjectDescriptionHelpers
//
//  Created by Bradley.yoon on 2023/07/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        self.start(application: application)
        
        return true
    }
    
}

extension AppDelegate {
    
    private func start(application: UIApplication) {
        self.setupAppCoordinator()
    }
    
    private func setupAppCoordinator() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        
        let appCoordinator = AppCoordinator(window: window)
        self.appCoordinator = appCoordinator
        appCoordinator.start()
    }
    
}
