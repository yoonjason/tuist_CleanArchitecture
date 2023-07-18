//
//  MainCoordinator.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

protocol MainCoordinating {
    func showDoSomethingScene(transitionType: TransitionType)
}

final class MainCoordinator: Coordinator {

    var children: [Coordinator] = []
    var navigationController: UINavigationController
    weak var parentCoordinator: Coordinator?
    private weak var mainViewController: MainViewController?


    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = MainViewModel(coordinator: self)
        let mainViewController = MainViewController(viewModel: viewModel)
        self.mainViewController = mainViewController
        self.navigationController.setViewControllers([mainViewController], animated: false)
    }

}

extension MainCoordinator: MainCoordinating {
    func showDoSomethingScene(transitionType: TransitionType) {
        let doSomethingCoordinator = DoSomethingCoordinator(
            navigationController: self.navigationController,
            transitionType: transitionType
        )
        doSomethingCoordinator.parentCoordinator = self
        doSomethingCoordinator.start()
        
    }
}
