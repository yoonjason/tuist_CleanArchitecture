//
//  ImageListViewController.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/07.
//

import UIKit

import RxCocoa
import RxDataSources
import RxSwift


/**
 Presentation > SomethingView > View에 그룹핑합니다.

 */

final class ImageListViewController: BaseViewController {

    private let viewModel: ImageListViewModel
    private let tableView: UITableView = .init()


    init(
        viewModel: ImageListViewModel
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

    override func bindOutput() -> Disposable {
        let input = ImageListViewModel.Input(
            viewDidLoad: rx.viewDidLoad.asObservable()
        )
        let output = viewModel.transform(input)
        let dataSource = RxTableViewSectionedAnimatedDataSource<SectionOfBasic> { dataSource, tableView, indexPath, item in
            let cell: ImageListCell = tableView.dequeueCell(indexPath: indexPath)
            cell.titleLabel.text = item.title
            return cell
        }
        
        /**
         헤더
         */
        dataSource.titleForHeaderInSection = { dataSource, index in
            return dataSource[index].header
        }
        
        /**
         edit관련
         
         dataSource.canEditRowAtIndexPath = { dataSource, index in
             return true
         }
         */
        
        return Disposables.create([
            super.bindOutput(),
            output.getBasic
                .bind(to: tableView.rx.items(dataSource: dataSource)),
            ])
        
        
    }

    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        setTableView()
    }

    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    func setTableView() {
        tableView.do {
            view.addSubview($0)
            $0.registerCell(cellType: ImageListCell.self)
        }
    }



}

extension ImageListViewController {

}
