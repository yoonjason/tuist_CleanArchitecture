//
//  ObservableConvertibleType+.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

extension ObservableConvertibleType {
  func asDriverSkipError() -> Driver<Element> {
    return asDriver(onErrorDriveWith: .empty())
  }
}
