//
//  AppDelegate.swift
//  SimpleGithubApp
//
//  Created by 박근형 on 2020/04/15.
//  Copyright © 2020 pgh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRootView()
        return true
    }
    
    private func setupRootView() {
      let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: UserListViewController())
      window.backgroundColor = .white
      window.makeKeyAndVisible()
      self.window = window
    }
}

