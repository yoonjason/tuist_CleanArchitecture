//
//  ImageListRepository.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/07.
//

import Foundation

import RxSwift
/**
 Noti: Data > Repositories에 그룹을 분리합니다.
 */

final class ImageListRepository: ImageListRepositoryProtocol {

    private var sections = BehaviorSubject(value: [
        SectionOfBasic(
            header: "Basic_First",
            items: [
                Basic(title: "1111"),
                Basic(title: "2222"),
            ]
        ),
        SectionOfBasic(
            header: "Basic_Second",
            items: [
                Basic(title: "3333"),
                Basic(title: "4444"),
            ]
        ),
        SectionOfBasic(
            header: "Basic_Third",
            items: [
                Basic(title: "5555"),
                Basic(title: "6666"),
            ]
        )
        ]
    )

    func doSomeThing() {

    }


    func requestBasicMoel() -> Observable<[SectionOfBasic]> {
        return sections.asObservable()
    }
    
    func test() -> Int {
        return 1
    }

}
