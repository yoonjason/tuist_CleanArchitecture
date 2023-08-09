//
//  ImageListCell.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/07.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

class ImageListCell: BaseTableViewCell {
    
    let titleLabel: UILabel = .init()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        titleLabel.do {
            $0.textColor = .gray
            $0.font = UIFont.systemFont(ofSize: 20)
            self.addSubview($0)
        }
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
        }
    }

}
