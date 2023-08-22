//
//  SplashViewController.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {
    
    weak var delegate: SplashCoordinatorDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            self.delegate?.nextScene()
        }
    
    }
    


}
