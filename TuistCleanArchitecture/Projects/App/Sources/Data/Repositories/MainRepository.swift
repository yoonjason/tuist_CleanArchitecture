//
//  MainRepository.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//

import Foundation

import RxSwift
/**
 Noti: Data > Repositories에 그룹을 분리합니다.
 */

final class MainRepository: MainRepositoryProtocol {
    
    private var section = BehaviorSubject(value: [
        SectionOfMain(header: "", items: [
            Main(title: .push),
            Main(title: .present),
            Main(title: .tableView),
            Main(title: .collectionView),
        ])
    ])
    
    func requestMainModel() -> Observable<[SectionOfMain]> {
        return section.asObservable()
    }
    
    func doSomeThing() {
        
    }
}
