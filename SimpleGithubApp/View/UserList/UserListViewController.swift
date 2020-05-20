//
//  UserListViewController.swift
//  SimpleGithubApp
//
//  Created by 박근형 on 2020/04/17.
//  Copyright © 2020 pgh. All rights reserved.
//

import UIKit
import SnapKit

class UserListViewController: BaseViewController {
    
    //MARK: Constants
    
    struct UI {
        struct TableView {
            static let estimateRowHeight: CGFloat = 100
        }
    }
    
    //MARK: UI Property
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = UI.TableView.estimateRowHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserListCell.classForCoder(), forCellReuseIdentifier: UserListCell.reuseIdentifier)
        return tableView
    }()
    
    //MARK: Property
    
    let viewModel: UserListViewModel = UserListViewModel()
    
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.updateUserList{ [weak self] response in
            if response.result == .failure {
                return
            }
            self?.reload()
        }
    }
    
    //MARK: Methods
    
    override func setupUI() {
        [tableView].forEach { view.addSubview($0) }
    }
    
    override func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func reload() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
