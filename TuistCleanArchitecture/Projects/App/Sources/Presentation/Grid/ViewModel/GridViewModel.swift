//
//  GridViewModel.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//

import Foundation

import RxSwift

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

extension GridViewModel: ViewModelType {
    
    struct Input {
        let viewDidLoad: Observable<Void>
    }
    
    struct Output {
        let outputViewDidLoad: Observable<Void>
    }
    
    func transform(_ input: Input) -> Output {
        let outputViewDidLoad = input.viewDidLoad.do(onNext: {
            print("FFFF")
        })
        
        return Output(
            outputViewDidLoad: outputViewDidLoad
        )
    }
    
}
