//
//  SceneDelegate.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/05.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        //자동로그인 
        if let windowScene = scene as? UIWindowScene{
            self.window = UIWindow(windowScene: windowScene)

            if UserDefaults.standard.string(forKey: "token") != nil {

                let initialView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainHome1")
                self.window?.rootViewController = initialView
                self.window?.makeKeyAndVisible()
            } else {
                
                let initialView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainHome1")
//                let initialView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FirstNavi")
                self.window?.rootViewController = initialView
                self.window?.makeKeyAndVisible()
            }
        }

        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
      
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
  
    }

    func sceneWillResignActive(_ scene: UIScene) {
   
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
  
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
     
    }
}
