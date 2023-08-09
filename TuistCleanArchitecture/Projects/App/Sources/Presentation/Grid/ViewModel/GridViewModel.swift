//
//  GridViewModel.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//

import Foundation

/**
 Presentation > SomethingView > ViewModel 에 그룹핑합니다.
 하나의 뷰모델에 여러가지의 UseCase가 있을 수 있습니다.
 
 */

final class GridViewModel {
    
    private let coordinator: GridCoordinating
    private let useCase: GridUseCaseProtocol
    
    init(
        coordinator: GridCoordinating,
        useCase: GridUseCaseProtocol
    ) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
}

extension GridViewModel {
    
}
