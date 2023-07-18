//
//  ViewModelType.swift
//  ProjectDescriptionHelpers
//
//  Created by Bradley.yoon on 2023/07/14.
//

import Foundation


protocol ViewModelType {

    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
    
}
