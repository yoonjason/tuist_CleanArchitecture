//
//  GridRepositoryProtocol.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//

import Foundation

import RxSwift
import Differentiator

/**
 Noti: Domain > Interface에 그룹을 분리합니다.
 */

protocol GridRepositoryProtocol: AnyObject {
    func doSomeThing()
    func requestGrid() -> Observable<[SectionOfGrid]>
}
