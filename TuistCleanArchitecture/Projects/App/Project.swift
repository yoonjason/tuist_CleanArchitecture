//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Bradley.yoon on 2023/07/14.
//

import ProjectDescription
import ProjectDescriptionHelpers

let appName = "ModularSwift"

let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleVersion": "1.0.0",
    "UILaunchScreen": [:],
    "App Transport Security Settings": ["Allow Arbitrary Loads": "YES"],
    "UILaunchStoryboardName": "LaunchScreen",
    "ENABLE_TESTS": .boolean(true),
]

let project = Project.makeModelue(
    name: appName,
    platform: .iOS,
    product: .app,
    dependencies: [
        .Project.Service,
        .Project.Feature
    ],
    sources: [
        "Application/**",
        "Sources/Common/**",
        "Sources/Extensions/**",
        "Sources/Data/**",
        "Sources/Presentation/**",
        "Sources/Domain/**",
        "Extensions/**",
    ],
    resources: [
        "Resources/**",
    ],
    infoPlist: .extendingDefault(with: infoPlist)
)
