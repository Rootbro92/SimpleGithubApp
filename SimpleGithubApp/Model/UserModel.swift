//
//  UserListModel.swift
//  SimpleGithubApp
//
//  Created by 박근형 on 2020/04/17.
//  Copyright © 2020 pgh. All rights reserved.
//

import Foundation

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

