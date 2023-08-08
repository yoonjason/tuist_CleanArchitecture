//
//  ImageListUseCase.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/07.
//

import Foundation

import RxSwift

/**
 Domain > UseCases 에 그룹핑합니다.
 */

protocol ImageListUseCaseProtocol {
    func execute()
    func getBasic() -> Observable<[SectionOfBasic]>
}

class ImageListUseCase: ImageListUseCaseProtocol
{
    private let imageListRepository: ImageListRepositoryProtocol
    
    init(
        imageListRepository: ImageListRepositoryProtocol
    ){
        self.imageListRepository = imageListRepository
    }
    
  func execute()
  {
//      imageListRepository.requestBasicMoel()
  }
    
    func getBasic() -> Observable<[SectionOfBasic]> {
        return imageListRepository.requestBasicMoel()
    }
    
    
}
