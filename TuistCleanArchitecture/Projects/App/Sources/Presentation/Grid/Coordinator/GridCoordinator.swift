//
//  GridCoordinator.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//

import UIKit

/**
 Presentation > SomethingView > Coordinator 에 그룹핑합니다.
 */

protocol GridCoordinating {
    func doSomeThing()
}

final class GridCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    weak var parentCoordinator: Coordinator?
    
    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.navigationController
            .pushViewController(
                getViewController(),
                animated: true
            )
    }
    
}

extension GridCoordinator: GridCoordinating {
    func doSomeThing() {
        
    }
    
}

extension GridCoordinator {
    func getViewController() -> GridViewController {
        let useCase = GridUseCase(
            GridRepository: GridRepository()
        )
        let viewModel = GridViewModel(
            coordinator: self,
            useCase: useCase
        )
        let viewController = GridViewController(
            viewModel: viewModel
        )
        
        return viewController
    }
}
