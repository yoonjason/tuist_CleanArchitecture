//
//  MainViewModel.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import Foundation
import RxSwift

final class MainViewModel {

    private let coordinator: MainCoordinating

    init(
        coordinator: MainCoordinating
    ) {
        self.coordinator = coordinator
    }

}

extension MainViewModel: ViewModelType {

    struct Input {
        let pushButtonTap: Observable<Void>
        let presentButtonTap: Observable<Void>

    }

    struct Output {
        let didTapPush: Observable<Void>
        let didTapPresent: Observable<Void>
    }

    func transform(_ input: Input) -> Output {

        let didTapPush = input.pushButtonTap
            .do(onNext: { [weak self] in
            guard let self = self else { return }
            self.coordinator.showDoSomethingScene(transitionType: .push)
        })

        let didTapPresent = input.presentButtonTap
            .do(onNext: { [weak self] in
            guard let self = self else { return }
            self.coordinator.showDoSomethingScene(transitionType: .present)
        })

        return Output(
            didTapPush: didTapPush,
            didTapPresent: didTapPresent
        )
    }

}

