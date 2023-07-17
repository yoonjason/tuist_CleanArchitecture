import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/



extension Project {
    
    
    public static func makeModelue (
        name: String,
        platform: Platform = .iOS,
        product: Product,
        organizationName: String = "YsCompnay",
        packages: [Package] = [],
        deploymentTarget: DeploymentTarget? = .iOS(targetVersion: "14.0", devices: [.iphone]),
        schemes: Scheme = Scheme(name: "YsCompany", shared: true, buildAction: .buildAction(targets: ["release"]), runAction: .runAction(executable: "release")),
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        infoPlist: InfoPlist = .default
    ) -> Project {
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                    .debug(name: .debug),
                    .release(name: .release)
            ], defaultSettings: .recommended
        )

        let appTarget = Target(
            name: name,
            platform: platform,
            product: product,
            bundleId: "\(organizationName).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )
        

        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "\(organizationName).\(name)Tests",
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: ["Tests/**"],
            dependencies: [.target(name: name)]
        )

        var schemes: [Scheme] = []

        var targets: [Target] = []
        
        if product == .app { //앱일 경우 타겟과 스킴이 여러개 필요하다. 테스트, 운영,
            let sandBoxTarget = Target(
                name: "\(name)-sandbox",
                platform: platform,
                product: product,
                bundleId: "\(organizationName).\(name)-sandbox",
                deploymentTarget: deploymentTarget,
                infoPlist: infoPlist,
                sources: sources,
                resources: resources,
                dependencies: dependencies
            )
            
            let cbtTarget = Target(
                name: "\(name)-cbt",
                platform: platform,
                product: product,
                bundleId: "\(organizationName).\(name)-cbt",
                deploymentTarget: deploymentTarget,
                infoPlist: infoPlist,
                sources: sources,
                resources: resources,
                dependencies: dependencies
            )
            
            targets = [appTarget, sandBoxTarget, cbtTarget, testTarget]
            schemes = [
                .makeScheme(target: .debug, name: name),
                .makeScheme(target: .debug, name: "\(name)-sandbox)"),
                .makeScheme(target: .debug, name: "\(name)-cbt)"),
            ]
            
        }else{
            targets = [appTarget, testTarget]
            schemes = [.makeScheme(target: .debug, name: name)]
        }

        return Project(
            name: name,
            organizationName: organizationName,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes
        )



    }


}

extension Scheme {
    static func makeScheme(target: ConfigurationName, product: Product = .staticFramework, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: product == .app ? .release : target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
    
}
