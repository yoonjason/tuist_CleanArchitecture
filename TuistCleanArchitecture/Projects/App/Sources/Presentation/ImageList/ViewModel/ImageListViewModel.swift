//
//  ImageListViewModel.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/07.
//

import Foundation

import RxSwift
/**
 Presentation > SomethingView > ViewModel 에 그룹핑합니다.
 하나의 뷰모델에 여러가지의 UseCase가 있을 수 있습니다.
 
 */

final class ImageListViewModel {

    private let coordinator: ImageListCoordinating
    private let useCase: ImageListUseCaseProtocol

    init(
        coordinator: ImageListCoordinating,
        useCase: ImageListUseCaseProtocol
    ) {
        self.coordinator = coordinator
        self.useCase = useCase
    }

}

extension ImageListViewModel: ViewModelType {
    struct Input {
        let viewDidLoad: Observable<Void>
    }

    struct Output {
        let getBasic: Observable<[SectionOfBasic]>
    }

    func transform(_ input: Input) -> Output {
        
        return Output(
            getBasic: self.useCase.getBasic()
        )
    }
}
