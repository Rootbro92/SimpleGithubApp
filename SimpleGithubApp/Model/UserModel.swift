//
//  UserListModel.swift
//  SimpleGithubApp
//
//  Created by 박근형 on 2020/04/17.
//  Copyright © 2020 pgh. All rights reserved.
//

import Foundation

//{
//    "login": "mojombo",
//    "id": 1,
//    "node_id": "MDQ6VXNlcjE=",
//    "avatar_url": "https://avatars0.githubusercontent.com/u/1?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/mojombo",
//    "html_url": "https://github.com/mojombo",
//    "followers_url": "https://api.github.com/users/mojombo/followers",
//    "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
//    "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
//    "organizations_url": "https://api.github.com/users/mojombo/orgs",
//    "repos_url": "https://api.github.com/users/mojombo/repos",
//    "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/mojombo/received_events",
//    "type": "User",
//    "site_admin": false
//}

struct User: Codable {
    var login: String
    var id: Int
    var nodeId: String
    var avatarURL: String
    var gravatarId: String
    var url: String
    var htmlURL: String
    var followersURL: String
    var followingURL: String
    var gistsURL: String
    var starredURL: String
    var subscriptionsURL: String
    var organizationsURL: String
    var reposURL: String
    var eventsURL: String
    var receivedEventsURL: String
    var type: String
    var siteAdmin: Bool
    
    enum CodingKeys: String, CodingKey {
        case login, id, url, type
        case nodeId = "node_id"
        case avatarURL = "avatar_url"
        case gravatarId = "gravatar_id"
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case siteAdmin = "site_admin"
    }
}

