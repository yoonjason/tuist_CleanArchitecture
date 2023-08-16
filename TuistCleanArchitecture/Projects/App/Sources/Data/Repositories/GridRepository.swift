//
//  GridRepository.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//

import Foundation

import Differentiator
import RxSwift
import RxDataSources

/**
 Noti: Data > Repositories에 그룹을 분리합니다.
 */

final class GridRepository: GridRepositoryProtocol {
    
//    private let sections: BehaviorSubject<[Grid]> = BehaviorSubject(value: [])
    private let sections: BehaviorSubject<[SectionOfGrid]> = BehaviorSubject(value: [
        SectionOfGrid(header: "hhee", items:
                    [
                        Grid(title: "어디로 갈까요"),
                        Grid(title: "동쪽 갈까요"),
                        Grid(title: "서쪽 갈까요"),
                        Grid(title: "남쪽 갈까요"),
                        Grid(title: "북쪽 갈까요")
                        
                    ])
    ])
    
    
    var sections2: BehaviorSubject<[Grid]> = BehaviorSubject(value: [])
    
    func requestGrid() -> Observable<[SectionOfGrid]> {
        return sections.asObservable()
    }
    
    func doSomeThing() {
        
    }
}
