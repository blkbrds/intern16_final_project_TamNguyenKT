//
//  AppDelegate.swift
//  FinalProject
//
//  Created by PCI0001 on 10/7/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import GoogleSignIn
import UIKit
import Firebase
import FBSDKCoreKit
import SVProgressHUD

enum RootType {
    case login
    case tabbar
}

typealias HUD = SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?
    static let shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else { fatalError("cant cast UIAPP") }
        return shared
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        changeRootViewController(changeRoot: .tabbar)
        window?.makeKeyAndVisible()

        FirebaseApp.configure()

        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID

        ApplicationDelegate.shared.application( application, didFinishLaunchingWithOptions: launchOptions )
        return true
    }

    func changeRootViewController(changeRoot: RootType) {
        switch changeRoot {
        case .login:
            window?.rootViewController = LoginViewController()
        default:
            window?.rootViewController = TabBarViewController()
        }
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
        changeRootViewController(changeRoot: .tabbar)
        } else {
            print(error.localizedDescription)
        }
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        guard let url = GIDSignIn.sharedInstance()?.handle(url) else { return true }
        return url
    }
}
