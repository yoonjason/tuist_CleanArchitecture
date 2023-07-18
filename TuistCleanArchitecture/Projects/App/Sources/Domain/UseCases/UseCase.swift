//
//  UseCase.swift
//  ProjectDescriptionHelpers
//
//  Created by Bradley.yoon on 2023/07/14.
//

import Foundation

protocol DoSomethingUseCaseProtocol {
    func execute ()
}

final class DoSomethingUseCase: DoSomethingUseCaseProtocol {
    
    private let doSomethingRepository: DoSomethingRepositoryProtocol
    
    init(
        doSomethingRepository: DoSomethingRepositoryProtocol
    ) {
        self.doSomethingRepository = doSomethingRepository
    }
    
    func execute() {
        
    }
    
}
