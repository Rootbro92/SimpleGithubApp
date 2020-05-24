//
//  Router.swift
//  SimpleGithubApp
//
//  Created by 박근형 on 2020/04/17.
//  Copyright © 2020 pgh. All rights reserved.
//

import Foundation
import Moya

enum GitHub {
    case userList(since: Int)
    case userInfo(login: String)
}

extension GitHub: TargetType {

    var baseURL: URL { return URL(string: "https://api.github.com")! }
    var path: String {
        switch self {
        case .userList:
            return "/users"
        case .userInfo:
            return "/users"
        }
    }

    var method: Moya.Method {
        switch self {
        case .userList:
            return .get
        case .userInfo:
            return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .userList:
            return "test data".data(using: .utf8)!
        case .userInfo:
            return "test data".data(using: .utf8)!
        }
    }

    var task: Task {
        switch self {
        case .userList(let since):
            return .requestParameters(parameters: ["since": since], encoding: URLEncoding.queryString)
        case .userInfo(let login):
            return .requestParameters(parameters: ["login": login], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

}
