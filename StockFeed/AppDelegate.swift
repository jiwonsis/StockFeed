//
//  AppDelegate.swift
//  StockFeed
//
//  Created by Scott moon on 13/12/2017.
//  Copyright © 2017 Scott moon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let dataService = GroupsDataService(viewModel: GroupsManager())
        let groupsViewController = GroupsViewController(dataService: dataService, viewModel: GroupsManager())
        let navigationController = UINavigationController(rootViewController: groupsViewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}

