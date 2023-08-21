//
//  ControlProperty+.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/21.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

extension Reactive where Base: UIButton {
    var myCustomTap: ControlProperty<String> {
        return base.rx.controlProperty(editingEvents: .touchUpInside) { base in
            return "custom"
        } setter: { base, value in
            print("value1 == \(base)")
            print("value2 == \(value)")
        }
    }
}


