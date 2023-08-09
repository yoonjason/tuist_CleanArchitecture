//
//  MainUseCase.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//

import Foundation

import RxSwift
/**
 Domain > UseCases 에 그룹핑합니다.
 */

protocol MainUseCaseProtocol {
    func execute()
    func getSectionModel() -> Observable<[SectionOfMain]>
}

class MainUseCase: MainUseCaseProtocol
{
    private let mainRepository: MainRepositoryProtocol
    
    init(
        MainRepository: MainRepositoryProtocol
    ){
        self.mainRepository = MainRepository
    }
    
  func execute()
  {
  }
    
    func getSectionModel() -> Observable<[SectionOfMain]> {
        return mainRepository.requestMainModel()
    }
    
    
}
