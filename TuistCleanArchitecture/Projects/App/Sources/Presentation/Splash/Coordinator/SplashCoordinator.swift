//
//  SplashCoordinator.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

protocol SplashCoordinatorDelegate: AnyObject {
    func nextScene()
}

final class SplashCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    weak var delegate: SplashCoordinatorDelegate?
    
    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let splashViewController = SplashViewController()
        splashViewController.delegate = delegate
        navigationController.setViewControllers([splashViewController], animated: false)
    }
    
    
}

