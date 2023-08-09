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
    func showListScene()
    func showGridScene()
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
        let viewModel = MainViewModel(
            coordinator: self,
            useCase: MainUseCase(
                MainRepository: MainRepository()
            )
        )
        let mainViewController = MainViewController(
            viewModel: viewModel
        )
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
    
    func showListScene() {
        let listCoordinator = ImageListCoordinator(
            navigationController: self.navigationController
        )
        listCoordinator.parentCoordinator = self
        listCoordinator.start()
    }
    
    func showGridScene() {
        let gridCoodrinator = GridCoordinator(
            navigationController: self.navigationController
        )
        gridCoodrinator.parentCoordinator = self
        gridCoodrinator.start()
    }
}
