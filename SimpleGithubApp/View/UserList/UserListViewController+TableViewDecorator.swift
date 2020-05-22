//
//  UserListViewController+TableViewDecorator.swift
//  SimpleGithubApp
//
//  Created by 박근형 on 2020/04/22.
//  Copyright © 2020 pgh. All rights reserved.
//

import Foundation
import UIKit

//MARK: UserListTableView DataSource

extension UserListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(UserListCell.self, for: indexPath)
        cell.viewModel = UserListCellViewModel(id: viewModel.userList[indexPath.row].id, avatarURL: viewModel.userList[indexPath.row].avatarURL, login: viewModel.userList[indexPath.row].login)
        return cell
    }
}

//MARK: UserListTableView Delegate

extension UserListViewController: UITableViewDelegate {
    
}
