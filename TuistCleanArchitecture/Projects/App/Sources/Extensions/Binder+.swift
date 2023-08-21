//
//  Binder+.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/21.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

extension Reactive where Base: UIViewController {

    var myCustom: Binder<Bool> {
        return Binder(self.base) { vc, boolValue in
            switch boolValue {
            case true:
                vc.view.backgroundColor = .black
            case false:
                vc.view.backgroundColor = .white
            }
        }
    }


}

extension Reactive where Base: UIButton {
    
    public func customChange() -> Binder<UIImage?> {
        return Binder(self.base) { button, image in
            button.setImage(image, for: [])
        }
    }
    
}
