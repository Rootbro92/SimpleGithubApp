//
//  UserListCell.swift
//  SimpleGithubApp
//
//  Created by 박근형 on 2020/04/22.
//  Copyright © 2020 pgh. All rights reserved.
//

import UIKit


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
    
    var viewModel: UserListCellViewModel! {
        didSet {
            avatarImageView.kf.setImage(with: URL(string: viewModel.avatarURL))
            idLabel.text = "\(viewModel.id)"
            loginLabel.text = viewModel.login
        }
    }
    
    //MARK: LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    
    override func setupUI() {
        [avatarImageView, idLabel, loginLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setupConstraints() {
        avatarImageView.snp.makeConstraints {
            $0.top.bottom.leading.equalTo(0)
            $0.width.equalTo(avatarImageView.snp.height)
        }
        
        idLabel.snp.makeConstraints {
            $0.trailing.equalTo(avatarImageView.snp.leading).offset(5)
            $0.leading.equalToSuperview().offset(5)
            $0.top.equalToSuperview().offset(20)
        }
        
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(10)
            $0.trailing.equalTo(idLabel.snp.trailing)
            $0.leading.equalTo(idLabel.snp.leading)
        }
    }
}
