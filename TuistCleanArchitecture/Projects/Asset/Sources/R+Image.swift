//
//  R+Image.swift
//  Asset
//
//  Created by Bradley.yoon on 2023/07/18.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

public extension R { enum Image { } }

public extension R.Image {
    static var xImage: UIImage { .load(name: "24_Button_X") }
    static var back: UIImage { .load(name: "Button_Back") }
}

public extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: .module, compatibleWith: nil) else {
            print(R.bundle?.bundleIdentifier, R.bundle?.bundlePath)
            assert(false, "\(name) 이미지 로드 실패")
            return UIImage()
        }
        return image
    }
}
