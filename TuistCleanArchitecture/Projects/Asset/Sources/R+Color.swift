//
//  R+Color.swift
//  Asset
//
//  Created by Bradley.yoon on 2023/07/18.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

public extension R { enum Color { } }

public extension R.Color {

    static var red: UIColor { .load(name: "Red") }
    static var testColor: UIColor { .load(name: "Testcolor") }

    struct Accent {
        public static var first: UIColor { .load(name: "Accent_First") }
        public static var second: UIColor { .load(name: "Accent_Second") }
        public static var third: UIColor { .load(name: "Accent_Third") }
    }

}

extension UIColor {
    static func load(name: String) -> UIColor {
        guard let color = UIColor(named: name, in: .module, compatibleWith: nil) else {
//            assert(false, "\(name) Color 로드 실패")
            return brown
        }
        return color
    }
}

