//
//  ImageListCoordinator.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/07.
//

import UIKit

protocol ImageListCoordinating {
    func doSomeThing()
}

final class ImageListCoordinator: Coordinator {
    
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var children: [Coordinator] = []
    
    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.navigationController.pushViewController(
            getViewController(),
            animated: true
        )
    }
    
}

extension ImageListCoordinator: ImageListCoordinating {
    func doSomeThing() {
        
    }
    
}

extension ImageListCoordinator {
    func getViewController() -> ImageListViewController {
        let useCase = ImageListUseCase(
            imageListRepository: ImageListRepository()
        )
        let viewModel = ImageListViewModel(
            coordinator: self,
            useCase: useCase
        )
        let viewController = ImageListViewController(viewModel: viewModel)
        return viewController
    }
}
