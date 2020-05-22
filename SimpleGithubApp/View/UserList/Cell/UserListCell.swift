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
        static let leadingMargin = 15
        static let trailingMargin = 15
        static let topMargin = 20
        static let bottomMargin = -20
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
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
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
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(UI.leadingMargin)
            $0.trailing.equalToSuperview().offset(UI.trailingMargin)
            $0.top.equalToSuperview().offset(UI.topMargin)
        }
        
        loginLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(UI.bottomMargin)
            $0.trailing.equalTo(idLabel.snp.trailing)
            $0.leading.equalTo(idLabel.snp.leading)
        }
    }
}
