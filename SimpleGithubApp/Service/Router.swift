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
    case userList(page: Int)
}

extension GitHub: TargetType {

    var baseURL: URL { return URL(string: "https://api.github.com")! }
    var path: String {
        switch self {
        case .userList:
            return "/users"
        }
    }

    var method: Moya.Method {
        switch self {
        case .userList:
            return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .userList:
            return "test data".data(using: .utf8)!
        }
    }

    var task: Task {
        switch self {
        case .userList(let page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

}
