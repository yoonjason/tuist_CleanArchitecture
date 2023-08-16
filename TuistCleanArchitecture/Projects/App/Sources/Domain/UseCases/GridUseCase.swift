//
//  GridUseCase.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//

import Foundation

import RxSwift
/**
 Domain > UseCases 에 그룹핑합니다.
 */

protocol GridUseCaseProtocol {
    func execute()
    func getGrid() -> Observable<[SectionOfGrid]>
}

class GridUseCase: GridUseCaseProtocol
{
    private let gridRepository: any GridRepositoryProtocol

    init(
        GridRepository: any GridRepositoryProtocol
    ) {
        self.gridRepository = GridRepository
    }
    
    func getGrid() -> Observable<[SectionOfGrid]> {
        debugPrint(#function)
        return gridRepository.requestGrid()
    }

    func execute()
    {
    }


}
