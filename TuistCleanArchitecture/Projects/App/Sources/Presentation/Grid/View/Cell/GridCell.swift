//
//  GridCell.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit


class GridCell: BaseCollectionViewCell {
    
    private let label: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setupViews() {
        super.setupViews()
        label.do {
            $0.textColor = .blue
            $0.font = UIFont.systemFont(ofSize: 15)
            self.addSubview($0)
        }
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureCell(withGrid: Grid) {
        print(withGrid.title)
        self.label.text = withGrid.title
    }
    
    
}
