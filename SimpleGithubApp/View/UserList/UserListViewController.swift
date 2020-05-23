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
            static let rowHeight: CGFloat = 100
        }
    }
    
    //MARK: UI Property
    
    private var refreshControl = UIRefreshControl()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = UI.TableView.estimateRowHeight
        tableView.rowHeight = UI.TableView.rowHeight
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserListCell.classForCoder(), forCellReuseIdentifier: UserListCell.reuseIdentifier)
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
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
            self?.tableView.refreshControl?.endRefreshing()
        }
    }
    
    func loadMoreData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            self.viewModel.since = self.viewModel.userList.last?.id ?? 0
            self.viewModel.updateUserList{ [weak self] response in
                if response.result == .failure {
                    return
                }
                self?.reload()
            }
        }
    }
    
    @objc func refresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.viewModel.userList.removeAll(keepingCapacity: true)
            self?.viewModel.since = 0
            self?.viewModel.updateUserList{ [weak self] response in
                if response.result == .failure {
                    return
                }
                self?.reload()
            }
        }
    }
}
