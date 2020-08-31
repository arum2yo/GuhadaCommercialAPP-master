//
//  BaseViewController.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/07.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import GoogleSignIn

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         view.endEditing(true)
     }
}

extension BaseViewController: GIDSignInDelegate{
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if error != nil {
            print(error.localizedDescription)
            return
        }
        
        guard let authentication = user.authentication else {
            return
        }
        
        let idToken = authentication.idToken
        
        AuthNetwok.googleLoginNetwork(idToken: idToken!, view: self) { 
           
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            
            let mainVC = mainStoryBoard.instantiateViewController(identifier: "MainHome1")
            UIApplication.shared.keyWindow?.rootViewController = mainVC
            
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
}
