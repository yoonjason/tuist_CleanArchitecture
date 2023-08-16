//
//  Grid.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import Foundation

import RxDataSources
import Differentiator

struct Grid {
    let title: String
}

extension Grid: IdentifiableType, Equatable {
    typealias Identity = String
    
    var identity: String {
        title
    }
}

struct SectionOfGrid {
    var header: String
    var items: [Grid]
}

extension SectionOfGrid: SectionModelType {
    typealias Item = Grid
    
    init(original: SectionOfGrid, items: [Grid]) {
        self = original
        self.items = items
    }
    
}
