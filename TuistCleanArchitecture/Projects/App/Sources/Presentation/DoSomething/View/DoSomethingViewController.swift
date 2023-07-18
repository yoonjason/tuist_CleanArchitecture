//
//  DoSomethingViewController.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift
import Asset

class DoSomethingViewController: BaseViewController {
    
    private let viewModel: DoSomethingViewModel
    private let closeButton: UIButton = .init()
    
    init(viewModel: DoSomethingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func setupViews() {
        super.setupViews()
        
        closeButton.do {
            $0.setTitle("닫기", for: .normal)
            $0.backgroundColor = .red
            $0.titleLabel?.textColor = .black
            view.addSubview($0)
        }
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        closeButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 50, height: 50))
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(0)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
    
    override func bindOutput() -> Disposable {
        let input = DoSomethingViewModel.Input(
            presentBackButton: self.closeButton.rx.tap.asObservable()
        )
        let output = viewModel.transform(input)
        
        return Disposables.create([
            super.bindOutput(),
            output.didTapPresentBackButton.subscribe()
        ])
    }
    

}
