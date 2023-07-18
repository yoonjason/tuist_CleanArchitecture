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

    static var red: UIColor { UIColor(named: "Other_First")! }

    struct Accent {
        static var first: UIColor { .load(name: "Accent_First") }
        static var second: UIColor { .load(name: "Accent_Second") }
        static var third: UIColor { .load(name: "Accent_Third") }
    }

}

public extension UIColor {
    static func load(name: String) -> UIColor {
        guard let color = UIColor(named: name, in: R.bundle, compatibleWith: nil) else {
            assert(true, "\(name) 컬러 로드 실패 \(R.bundle)")
            return UIColor()
        }
        return color
    }
}
