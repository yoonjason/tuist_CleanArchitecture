//
//  BaseCollectionViewCell.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

import RxSwift
import SnapKit
import Then

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setupViews() {
        
    }
    
    func setupLayoutConstraints() {
        
    }
    
    
}
