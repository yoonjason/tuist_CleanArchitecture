//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Bradley.yoon on 2023/07/14.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModelue(
    name: "Service",
    product: .staticFramework,
    dependencies: [
        .Project.ThirdPartyLib
    ]
)
