//
//  UserListCell.swift
//  SimpleGithubApp
//
//  Created by 박근형 on 2020/04/22.
//  Copyright © 2020 pgh. All rights reserved.
//

import UIKit
import SnapKit

class UserListCell: BaseTableViewCell {
    
    //MARK: Constant
    
    struct UI {
    }
    
    //MARK: UI Properties
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    //MARK: Methods
    override func setupUI() {
        [avatarImageView, idLabel, loginLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setupConstraints() {
        avatarImageView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.width.equalTo(avatarImageView.snp.height)
        }
    }
}
