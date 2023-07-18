//
//  ViewControllable.swift
//  ProjectDescriptionHelpers
//
//  Created by Bradley.yoon on 2023/07/14.
//

import RxSwift

protocol ViewControllable: Presentable {
    var disposeBag: DisposeBag { get set }
    
    func bindOutput() -> Disposable
}

protocol Presentable {
    func setupViews()
    func setupLayoutConstraints()
}
