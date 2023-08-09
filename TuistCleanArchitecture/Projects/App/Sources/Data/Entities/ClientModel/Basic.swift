//
//  Basic.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/08.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import Foundation

import RxDataSources
import RxSwift

struct Basic {
    let title: String
}

extension Basic: IdentifiableType, Equatable {
    typealias Identity = String
    
    var identity: String {
        return title
    }
}

struct SectionOfBasic {
    var header: String
    var items:[Item]
}

extension SectionOfBasic: AnimatableSectionModelType {
    typealias Item = Basic
    typealias Identity = String
    
    var identity: String {
        header
    }
    
    init(original: SectionOfBasic, items: [Basic]) {
        self = original
        self.items = items
    }
}

