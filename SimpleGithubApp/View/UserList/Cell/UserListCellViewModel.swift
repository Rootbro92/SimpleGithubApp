//
//  UserListCellViewModel.swift
//  SimpleGithubApp
//
//  Created by 박근형 on 2020/04/22.
//  Copyright © 2020 pgh. All rights reserved.
//

import Foundation

class UserListCellViewModel {
    
    //MARK: Property
    
    var id: Int = 0
    var avatarURL: String = ""
    var login: String = ""
    

    //MARK: Init
    
    init(id: Int, avatarURL: String, login: String) {
        self.id = id
        self.avatarURL = avatarURL
        self.login = login
    }
}
