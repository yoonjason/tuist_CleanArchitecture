//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Bradley.yoon on 2023/07/18.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModelue(
    name: "Asset",
    product: .staticFramework,
    sources: [
        "Sources/**"
    ],
    resources: [
        "Resources/**"
    ]
)


