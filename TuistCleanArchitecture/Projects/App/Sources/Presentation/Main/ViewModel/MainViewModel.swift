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
    private let useCase: MainUseCase

    init(
        coordinator: MainCoordinating,
        useCase: MainUseCase
    ) {
        self.coordinator = coordinator
        self.useCase = useCase
    }

}

extension MainViewModel: ViewModelType {

    struct Input {
        let pushButtonTap: Observable<Void>
        let presentButtonTap: Observable<Void>
        let listButtonTap: Observable<Void>
        let viewDidLoad: Observable<Void>
        let selectedRow: Observable<MainData>
    }

    struct Output {
        let didTapPush: Observable<Void>
        let didTapPresent: Observable<Void>
        let didTapList: Observable<Void>
        let getSection: Observable<[SectionOfMain]>
        let selectedRow: Observable<MainData>
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

        let didTapList = input.listButtonTap
            .do(onNext: { [weak self] in
            guard let self = self else { return }
            self.coordinator.showListScene()
        })

        let selctedRow = input.selectedRow.do(onNext: {
            switch $0 {
            case .push:
                self.coordinator.showDoSomethingScene(transitionType: .push)
            case .present:
                self.coordinator.showDoSomethingScene(transitionType: .present)
            case .tableView:
                self.coordinator.showListScene()
            case .collectionView:
                self.coordinator.showGridScene()
            }
        })

        return Output(
            didTapPush: didTapPush,
            didTapPresent: didTapPresent,
            didTapList: didTapList,
            getSection: useCase.getSectionModel(),
            selectedRow: selctedRow
        )
    }

}

