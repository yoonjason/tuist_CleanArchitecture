//
//  UIViewController+RX.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

extension Reactive where Base: UIViewController {
    var viewDidLoad: ControlEvent<Void> {
        let event = self.methodInvoked(#selector(Base.viewDidLoad))
            .map { _ in }

        return ControlEvent(events: event)
    }

    var viewWillAppear: ControlEvent<Void> {
        let event = self.methodInvoked(#selector(Base.viewWillAppear(_:)))
            .map { _ in }

        return ControlEvent(events: event)
    }
    
    var viewDidAppear: ControlEvent<Void> {
        let event = self.methodInvoked(#selector(Base.viewDidAppear(_:)))
            .map { _ in }

        return ControlEvent(events: event)
    }

    var viewWillDisappear: ControlEvent<Void> {
        let event = self.methodInvoked(#selector(Base.viewWillDisappear(_:)))
            .map { _ in }

        return ControlEvent(events: event)
    }

    var viewDidDisappear: ControlEvent<Void> {
        let event = self.methodInvoked(#selector(Base.viewDidDisappear(_:)))
            .map { _ in }

        return ControlEvent(events: event)
    }
}

