//
//  MainViewController.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

import RxCocoa
import RxDataSources
import RxSwift

class MainViewController: BaseViewController {
    
    private let viewModel: MainViewModel
    private let pushButton: UIButton = .init()
    private let presentButton: UIButton = .init()
    private let listButton: UIButton = .init()
    private let tableView: UITableView = .init()
    private let indexSubject: PublishSubject<MainData> = PublishSubject<MainData>()
    
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
        self.navigationItem.title = "main"
        self.rx.viewWillAppear
            .take(1)
            .subscribe(onNext: {
                print("이게 되나?")
            })
            .disposed(by: disposeBag)
        
    }
    
    override func bindOutput() -> Disposable {
        
        let dataSources = RxTableViewSectionedAnimatedDataSource<SectionOfMain> { section, tableView, indexPath, item in
            let cell: MainTableViewCell = tableView.dequeueCell(indexPath: indexPath)
            cell.titleLabel.text = item.title.rawValue
            cell.selectionStyle = .none
            return cell
        }
        
        tableView.rx.modelSelected(Main.self)
            .subscribe(onNext: {
                self.indexSubject.onNext($0.title)
            })
            .disposed(by: disposeBag)
        

        let input = MainViewModel.Input(
            pushButtonTap: pushButton.rx.tap.asObservable(),
            presentButtonTap: presentButton.rx.tap.asObservable(),
            listButtonTap: listButton.rx.tap.asObservable(),
            viewDidLoad: self.rx.viewDidLoad.asObservable(),
            selectedRow: indexSubject.asObservable()
        )
        
        let output = viewModel.transform(input)
        
        return Disposables.create([
            super.bindOutput(),
        
            Observable.merge(
                output.didTapPresent,
                output.didTapPush,
                output.didTapList
            ).subscribe(),
            
            output.selectedRow.subscribe(),
            
            output.getSection
                .bind(to: self.tableView.rx.items(dataSource: dataSources))
        ])
    }
    
    override func setupViews() {
        super.setupViews()
        setButton()
        tableView.do {
            $0.registerCell(cellType: MainTableViewCell.self)
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = 80
            $0.rx.setDelegate(self).disposed(by: disposeBag)
            view.addSubview($0)
        }
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
        
        listButton.snp.makeConstraints {
            $0.top.equalTo(presentButton).offset(100)
            $0.size.equalTo(CGSize(width: 100, height: 100))
            $0.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
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
        
        listButton.do {
            $0.setTitle("list", for: .normal)
            view.addSubview($0)
        }
    }

}


extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
