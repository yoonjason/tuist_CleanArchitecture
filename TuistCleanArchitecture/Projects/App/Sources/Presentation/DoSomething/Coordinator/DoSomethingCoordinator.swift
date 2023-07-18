//
//  DoSomethingCoordinator.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

protocol DoSomethingCoordinating: AnyObject {
    func doSomething()
    func presentDismiss()
}

final class DoSomethingCoordinator: Coordinator {
    
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var children: [Coordinator] = []
    var transitionType: TransitionType
    
    init(
        navigationController: UINavigationController,
        transitionType: TransitionType
    ) {
        self.navigationController = navigationController
        self.transitionType = transitionType
    }
    
    func start() {
        switch transitionType {
        case .push:
            navigationController.pushViewController(
                getViewController(),
                animated: true
            )
        case .present:
            let presentNavigationController = UINavigationController(rootViewController: getViewController())
            presentNavigationController.modalPresentationStyle = .fullScreen
            self.navigationController.present(presentNavigationController, animated: true)
        }
        
    }
    
}

extension DoSomethingCoordinator: DoSomethingCoordinating {
    
    func doSomething() {
        
    }
    
    func presentDismiss() {
        self.navigationController.dismiss(animated: true)
    }
    
}

extension DoSomethingCoordinator {
    func getViewController() -> DoSomethingViewController {
        let useCase = DoSomethingUseCase(doSomethingRepository: DoSomethingRepository())
        let viewModel = DoSomethingViewModel(
            coordinator: self,
            useCase:useCase
        )
        let viewController = DoSomethingViewController(viewModel: viewModel)
        return viewController
    }
}
