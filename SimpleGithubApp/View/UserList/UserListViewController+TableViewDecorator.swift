//
//  UserListViewController+TableViewDecorator.swift
//  SimpleGithubApp
//
//  Created by 박근형 on 2020/04/22.
//  Copyright © 2020 pgh. All rights reserved.
//

import Foundation
import UIKit

extension UserListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.numberOfRowsInSection())
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(UserListCell.self, for: indexPath)
        return cell
    }
}
extension UserListViewController: UITableViewDelegate {
    
}
