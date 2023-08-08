//
//  ImageListRepositoryProtocol.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/07.
//

import Foundation

import RxSwift

/**
 Noti: Domain > Interface에 그룹을 분리합니다.
 */

protocol ImageListRepositoryProtocol {
    func doSomeThing()
    func requestBasicMoel() -> Observable<[SectionOfBasic]>
}
