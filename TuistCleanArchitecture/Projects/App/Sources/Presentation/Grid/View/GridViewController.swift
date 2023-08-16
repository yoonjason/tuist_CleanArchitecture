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

        flowLayout.do {
            $0.minimumLineSpacing = 0
            $0.minimumInteritemSpacing = 0
            $0.scrollDirection = .horizontal
        }

        collectionView.do {
            $0.registerCell(ofType: GridCell.self)
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

        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionOfGrid> { dataSource, collectionView, indexPath, item in
            let cell: GridCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configureCell(withGrid: item)
            return cell
        }
        
        Observable.combineLatest(self.collectionView.rx.itemSelected, self.collectionView.rx.modelSelected(Grid.self))
            .subscribe(onNext: { indexPath, grid in
                print(indexPath, grid)
            })
            .disposed(by: disposeBag)

        return Disposables.create([
            super.bindOutput(),
            output
                .outputViewDidLoad
                .bind(to: self.collectionView.rx.items(dataSource: dataSource))

            ])
    }
}

extension GridViewController {



}

