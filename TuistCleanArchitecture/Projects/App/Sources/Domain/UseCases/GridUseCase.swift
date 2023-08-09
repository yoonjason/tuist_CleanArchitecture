//
//  GridUseCase.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//

import Foundation

/**
 Domain > UseCases 에 그룹핑합니다.
 */

protocol GridUseCaseProtocol {
    func execute()
}

class GridUseCase: GridUseCaseProtocol
{
    private let gridRepository: GridRepositoryProtocol
    
    init(
        GridRepository: GridRepositoryProtocol
    ){
        self.gridRepository = GridRepository
    }
    
  func execute()
  {
  }
    
    
}
