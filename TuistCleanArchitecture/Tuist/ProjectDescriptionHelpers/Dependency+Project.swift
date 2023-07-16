//
//  Dependency+Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Bradley.yoon on 2023/07/11.
//

import ProjectDescription

public extension TargetDependency {
    enum Project { }
}

public extension TargetDependency.Project {
    static let Feature = TargetDependency.project(target: "Feature", path: .relativeToRoot("Projects/Feature"))
    static let Service = TargetDependency.project(target: "Service", path: .relativeToRoot("Projects/Service"))
    static let ThirdPartyLib = TargetDependency.project(target: "ThirdPartyLib", path: .relativeToRoot("Projects/ThirdPartyLib"))
    static let PhotoViewer = TargetDependency.project(target: "PhotoViewer", path: .relativeToRoot("Projects/PhotoViewer"))
}
