//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Bradley.yoon on 2023/07/14.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModelue(
    name: "ThirdPartyLib",
    product: .framework,
    packages: [
    
    ],
    dependencies: [
        .SPM.Moya,
        .SPM.Alamofire,
        .SPM.Then,
        .SPM.RxSwift,
        .SPM.RxCocoa,
        .SPM.SnapKit,
        .SPM.RxDataSources,
        .SPM.SkeletonView
    ]
)
