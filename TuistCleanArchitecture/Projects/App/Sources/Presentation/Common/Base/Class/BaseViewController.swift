//
//  BaseViewController.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/14.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit
import Feature

import RxSwift
import SnapKit
import Then

class BaseViewController: UIViewController, ViewControllable {

    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayoutConstraints()
        bindOutput()
            .disposed(by: disposeBag)
    }

    func setupViews() {
        
    }

    func setupLayoutConstraints() {

    }

    func bindOutput() -> Disposable {
        return Disposables.create()
    }

}
