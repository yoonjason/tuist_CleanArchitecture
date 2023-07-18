//
//  Coordinator.swift
//  ProjectDescriptionHelpers
//
//  Created by Bradley.yoon on 2023/07/14.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var children: [Coordinator] { get set }
    
    func start()
    
    func addChild(_ child: Coordinator)
}

extension Coordinator {
    func addChild(_ child: Coordinator) {
        self.children.append(child)
    }
}

enum TransitionType {
    case push
    case present
}
