//
//  GridViewController.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/09.
//

import UIKit

import Differentiator
import RxCocoa
import RxDataSources
import RxSwift

/**
 Presentation > SomethingView > View에 그룹핑합니다.

 */

final class GridViewController: BaseViewController {
    
    typealias SectionOfGrid = AnimatableSectionModel<String, Grid>
    private let viewModel: GridViewModel
    private let flowLayout: UICollectionViewFlowLayout = .init()
    private lazy var collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: flowLayout)
    
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
    
    override func setupViews() {
        super.setupViews()
        self.view.backgroundColor = .white
        collectionView.do {
            $0.registerCell(ofType: GridCell.self)
            $0.backgroundColor = .blue
            
            view.addSubview($0)
        }
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    
    override func bindOutput() -> Disposable {
        
        let input = GridViewModel.Input(
            viewDidLoad: rx.viewDidLoad.asObservable()
        )
        
        let output = viewModel.transform(input)
        
        return Disposables.create([
            super.bindOutput(),
            output
                .outputViewDidload
                .subscribe(),
        ])
    }
}

extension GridViewController {


    
}

