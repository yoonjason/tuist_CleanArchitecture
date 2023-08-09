//
//  MainTableViewCell.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

class MainTableViewCell: BaseTableViewCell {
    let titleLabel: UILabel = .init()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupViews() {
        super.setupViews()
        titleLabel.do {
            $0.textColor = .gray
            self.addSubview($0)
        }
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().offset(20)
        }
    }

}


extension MainTableViewCell {
    
}
