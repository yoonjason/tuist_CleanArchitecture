//
//  GridViewController.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//

import UIKit

/**
 Presentation > SomethingView > View에 그룹핑합니다.

 */

final class GridViewController: UIViewController {
    
    private let viewModel: GridViewModel
    
    init(
        viewModel: GridViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}

