//
//  Main.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import Foundation

import RxDataSources
import RxSwift

enum MainData: String {
    case push = "push"
    case present = "present"
    case tableView = "tableView RxDataSources"
    case collectionView = "collectionView RxDataSources"
}

struct Main {
    let title: MainData
}

extension Main: IdentifiableType, Equatable {
    typealias Identity = MainData
    
    var identity: MainData {
        .tableView
    }
}

struct SectionOfMain {
    var header: String
    var items: [Main]
}

extension SectionOfMain: AnimatableSectionModelType {
    typealias Identity = String
    typealias Item = Main
    
    var identity: String { header }
    
    init(original: SectionOfMain, items: [Main]) {
        self = original
        self.items = items
    }
    
}
