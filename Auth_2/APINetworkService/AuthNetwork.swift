//
//  AuthNetwork.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/05.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import ProgressHUD
import Moya
import SwiftyJSON
import UIKit

class AuthNetwok: UIViewController{
    
    static let decoder = JSONDecoder()
    static let provider = MoyaProvider<AuthService>()
    
    static func getCurrentUser(userId: String){
        
    }
    
    static func registerNetwork(name:String, email:String, password:String, view: UIViewController, completion: @escaping (_ message:String)->Void){
        
        provider.request(.register(name: name, email: email, password: password)) { (result) in
            switch result{
                
            case .success(let response):
                print(" response.StatusCode-> \(response.statusCode)")
                
                let jsonData = JSON(response.data)
                
                if response.statusCode == 200 {
                    
                    print(jsonData["message"].string!)
                    completion(jsonData["message"].string!)
                    
                } else if response.statusCode == 400 {
                    
                    AlertService.alert(title: "Failed Sign up", msg: "Chk details", view: view){}
                    print(response.data)
                    
                } else {
                    
                    print("500_error")
                }
                break
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    static func loginNetwork(email:String, password:String, view: UIViewController, completion: @escaping()->Void){
        
        provider.request(.login(email: email, password: password)) { (result) in
            
            switch result{
                
            case .success(let response):
                
                let jsonData = JSON(response.data)
                
                if response.statusCode == 200 {
                    
                    print(jsonData)
                    
                    var tokenInfo = jsonData["token"].string
                    UserDefaults.standard.set(tokenInfo, forKey: "token") //접속정보저장 (자동로그인)
                    
                    let initialView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FirstNavi")
                    
                    AlertService.alert(title: "success", msg: "you ar login", view: view) {
                    }
                    completion()
                    
                } else if response.statusCode == 400 {
                    
                    AlertService.alert(title: "Failed Log In", msg: "CHK EMail or PWD", view: view ){}
                    print(response.data)
                    
                } else {
                    print("500_error")
                }
                break
                
            case .failure(let error):
                
                print(error.localizedDescription)
                break
            }
        }
    }
    
    static func forgetPWD(email: String, view: UIViewController, completion:@escaping ()->Void){
        
        provider.request(.forgetPWD(email: email)) { (result) in
            
            switch result{
                
            case .success(let response):
                
                let jsonData = JSON(response.data)
                
                if response.statusCode == 200 {
                    
                    completion()
                    
                } else if response.statusCode == 400 {
                    
                    AlertService.alert(title: "error", msg: "Check your emailAddress", view: view){}
                    
                    return
                }
                break
                
            case .failure(let error):
                
                print(error.localizedDescription)
                break
            }
        }
    }
    
    static func facebookLoginNetwork(userId:String, accessToken:String, completion: @escaping ()->Void){
        
        provider.request(.faceBookLogin(userId: userId, accessToken: accessToken)) { (result) in
            switch result{
                
            case .success(let response):
                
                let jsonData = JSON(response.data)
                print("faceJsonData", jsonData)
                
                if response.statusCode == 200 {
                    
                    
                    var tokenInfo = jsonData["token"].string
                    var userId = jsonData["user"]["_id"].string
                    
                    print("facebookUser", userId)
                    
                    UserDefaults.standard.set(tokenInfo, forKey: "token")
                    UserDefaults.standard.set(userId, forKey: "userId")
                    
                    print("facebooktokenInfo", tokenInfo)
                    
                    completion()
                    
                } else {
                    
                    print("Error in server!")
                }
                break
                
            case .failure(let error):
                
                print(".failure//->\(error.localizedDescription)")
                break
            }
        }
    }
    
    static func googleLoginNetwork(idToken: String, view: UIViewController, completion:@escaping ()->Void){
        
        provider.request(.googleLogin(idToken: idToken)) { (result) in
            switch result{
                
            case .success(let response):
                
                let jsonData = JSON(response.data)
                print("googleJson",jsonData)
                
                let token = jsonData["token"].string
                UserDefaults.standard.set(token, forKey: "token")
                
                completion()
                
                break
                
            case .failure(let error):
                
                print(error)
                break
            }
        }
    }
}
