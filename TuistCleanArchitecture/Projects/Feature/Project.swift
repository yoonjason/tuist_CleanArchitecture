//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Bradley.yoon on 2023/07/14.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModelue(
    name: "Feature",
    product: .staticFramework,
    dependencies: [
        .Project.Service,
    ],
    sources: [
        "Sources/**"
    ],
    resources: [
        "Resources/**"
    ]

)
