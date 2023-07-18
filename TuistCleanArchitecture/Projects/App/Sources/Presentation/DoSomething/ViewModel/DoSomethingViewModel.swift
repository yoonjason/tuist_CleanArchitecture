//
//  DoSomethingViewModel.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import Foundation

import RxSwift

final class DoSomethingViewModel {

    private let coordinator: DoSomethingCoordinating
    private let useCase: DoSomethingUseCaseProtocol

    init(
        coordinator: DoSomethingCoordinating, useCase: DoSomethingUseCaseProtocol
    ) {
        self.coordinator = coordinator
        self.useCase = useCase
    }

}

extension DoSomethingViewModel: ViewModelType {

    struct Input {
        let presentBackButton: Observable<Void>
    }
    struct Output {
        let didTapPresentBackButton: Observable<Void>
    }

    func transform(_ input: Input) -> Output {
        let didTapPresentBackButton = input.presentBackButton
            .do(onNext: { [weak self] in
                guard let self = self else { return }
                self.coordinator.presentDismiss()
            })
            

        return Output(
            didTapPresentBackButton: didTapPresentBackButton
        )
    }
}
