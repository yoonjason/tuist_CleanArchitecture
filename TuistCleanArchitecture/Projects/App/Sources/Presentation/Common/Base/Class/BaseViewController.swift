//
//  BaseViewController.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/14.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

import RxSwift

class BaseViewController: UIViewController {
    
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setupViews() {
        
    }
    
    func setupLayoutConstraints() {
        
    }
    
    func bindOutput() -> Disposable {
        return Disposables.create()
    }

}
