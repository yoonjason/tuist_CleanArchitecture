//
//  MainViewController.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

class MainViewController: BaseViewController {
    
    private let viewModel: MainViewModel
    private let pushButton: UIButton = .init()
    private let presentButton: UIButton = .init()
    
    init(
        viewModel: MainViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
    }
    
    override func bindOutput() -> Disposable {
        let input = MainViewModel.Input(
            pushButtonTap: pushButton.rx.tap.asObservable(),
            presentButtonTap: presentButton.rx.tap.asObservable()
        )
        let output = viewModel.transform(input)
        return Disposables.create([
            super.bindOutput(),
        
            Observable.merge(
                output.didTapPresent,
                output.didTapPush
            ).subscribe()
        
        ])
    }
    
    override func setupViews() {
        super.setupViews()
        setButton()

    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        pushButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        presentButton.snp.makeConstraints {
            $0.top.equalTo(pushButton).offset(100)
            $0.size.equalTo(CGSize(width: 100, height: 100))
            $0.centerX.equalToSuperview()
        }
    }
    
    func setButton() {
        pushButton.do {
            $0.setTitle("push", for: .normal)
            view.addSubview($0)
        }
        
        presentButton.do {
            $0.setTitle("present", for: .normal)
            view.addSubview($0)
        }
    }

}
