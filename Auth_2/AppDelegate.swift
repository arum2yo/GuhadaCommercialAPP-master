//
//  AppDelegate.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/05.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon
import FBSDKCoreKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if (UserDefaults.standard.string(forKey: "token") != nil){
            
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            let mainVC = mainStoryBoard.instantiateViewController(identifier: "MainHome1")
            UIApplication.shared.keyWindow?.rootViewController = mainVC
        } else {
            
           let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
           let mainVC = mainStoryBoard.instantiateViewController(identifier: "FirstNavi")
           UIApplication.shared.keyWindow?.rootViewController = mainVC
        }
        
        //kakao login
        KakaoSDKCommon.initSDK(appKey: "015e0b0c0ed54e37338203432641f8ef")
        
        //facebook login
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //google login
        GIDSignIn.sharedInstance()?.clientID = "72127693930-ge79s6ssd6jsofb5iok4nu2vac525t9r.apps.googleusercontent.com"
        
        return true
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        var handled = false
        
        handled = GIDSignIn.sharedInstance().handle(url)
        
        return handled
    }
    
//다른 URL을 시작하겠다는 설치가이드, 공식문서
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            var handled = false

            if url.absoluteString.contains("fb") {
                handled = ApplicationDelegate.shared.application(app, open: url, options: options)
            }

            return handled
        }

    // MARK:- UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
}

