//
//  UserListViewModel.swift
//  SimpleGithubApp
//
//  Created by 박근형 on 2020/04/22.
//  Copyright © 2020 pgh. All rights reserved.
//

import UIKit

class UserListViewModel {
    
    enum CellType: Int {
        case userList
    }
    
    //MARK: Properties
    
    var userList: [User] = []
    private var since: Int = 0
    
    func numberOfRowsInSection() -> Int {
        return userList.count
    }
    
    func updateUserList(completion: @escaping (NetworkResponse) -> Void ,since: Int = 0) {
        Network.shared.request(target: .userList(since: since), decoder: [User].self) { [weak self] response in
            switch response.result {
            case .success:
                let result = response.json as! [User]
                self?.userList = result
            case .failure:
                guard response.error == nil else {
                    print(response.error!)
                    return
                }
            }
            completion(response)
        }
    }
}
