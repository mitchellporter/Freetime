//
//  AppDelegate.swift
//  Freetime
//
//  Created by Ryan Nystrom on 4/30/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var showingLogin = false
    let flexController = FlexController()

    let sessionManager = GithubSessionManager()
    lazy var rootNavigationManager: RootNavigationManager = {
        return RootNavigationManager(
            sessionManager: self.sessionManager,
            rootViewController: self.window?.rootViewController as! UISplitViewController
        )
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // initialize a webview at the start so webview startup later on isn't so slow
        let _ = UIWebView()
        flexController.configureWindow(window)
        rootNavigationManager.resetRootViewController(userSession: sessionManager.focusedUserSession)
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        if showingLogin == false && sessionManager.focusedUserSession == nil {
            showingLogin = true
            rootNavigationManager.showLogin(animated: false)
        }
    }
    
}
