//
//  Dependency+SPM.swift
//  ProjectDescriptionHelpers
//
//  Created by Bradley.yoon on 2023/07/10.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM { }
}

public extension TargetDependency.SPM {
    static let Moya = TargetDependency.external(name: "Moya")
    static let Then = TargetDependency.external(name: "Then")
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let RxSwift = TargetDependency.external(name: "RxSwift")
    static let RxCocoa = TargetDependency.external(name: "RxCocoa")
    static let SnapKit = TargetDependency.external(name: "SnapKit")
}
