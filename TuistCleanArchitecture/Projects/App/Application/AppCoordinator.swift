//
//  AppCoordinator.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    static var statusBarView: UIView?
    
    init(window: UIWindow) {
        self.navigationController = UINavigationController()
        navigationController.view.backgroundColor = .white
        navigationController.navigationBar.barTintColor = .white
        navigationController.navigationBar.tintColor = .darkGray
        navigationController.navigationBar.shadowImage = UIImage()
        
        
        window.rootViewController = navigationController
        
        let statuaBarManager = window.windowScene?.statusBarManager
        let statusBarView = UIView(frame: statuaBarManager?.statusBarFrame ?? .zero)
        statusBarView.backgroundColor = .white
        window.addSubview(statusBarView)
        type(of: self).statusBarView = statusBarView
    }
    
    func start() {
        let splashCoordinator = SplashCoordinator(navigationController: self.navigationController)
        splashCoordinator.delegate = self
        addChild(splashCoordinator)
        splashCoordinator.start()
    }
}

extension AppCoordinator: SplashCoordinatorDelegate {
    func nextScene() {
        let mainCoordinator = MainCoordinator(navigationController: self.navigationController)
        mainCoordinator.parentCoordinator = self
        self.addChild(mainCoordinator)
        mainCoordinator.start()
    }
}

