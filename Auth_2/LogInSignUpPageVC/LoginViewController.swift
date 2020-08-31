//
//  ViewController.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/05.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import Moya
import FBSDKLoginKit
import AuthenticationServices
import GoogleSignIn
import KakaoSDKAuth

import ProgressHUD

class LoginViewController: BaseViewController {
    
    @IBOutlet var loginProvideStackView: UIStackView!
    
    @IBOutlet var appleLogin: ASAuthorizationAppleIDButton!
    
    @IBOutlet weak var authEmail: UITextField!{
        didSet{
            authEmail.layer.borderWidth = 1
            authEmail.layer.borderColor = UIColor(white: 238.0 / 255.0, alpha: 1.0).cgColor
            authEmail.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        }
    }
    @IBOutlet weak var authPassword: UITextField!{
        didSet{
            authPassword.layer.borderWidth = 1
            authPassword.layer.borderColor = UIColor(white: 238.0 / 255.0, alpha: 1.0).cgColor
            authPassword.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
            authPassword.isSecureTextEntry = true
        }
    }
    
    @IBOutlet weak var concentraintToBottom: NSLayoutConstraint!
    
    @IBOutlet weak var authLoginBTN: UIButton!{
        didSet{
            authLoginBTN.layer.borderWidth = 1
            authLoginBTN.layer.borderColor = UIColor(white: 204.0 / 255.0, alpha: 1.0).cgColor
            
        }
    }
    
    @IBOutlet weak var BTNautoLogin: UIButton!
    @IBOutlet weak var BTNsaveId: UIButton!
     
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        self.ButonAction()

    }

    @IBAction func authLoginBTNTap(_ sender: Any) {
        
        AuthNetwok.loginNetwork(email: self.authEmail.text!, password: self.authPassword.text!, view: self){
            
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            
            let mainVC = mainStoryBoard.instantiateViewController(identifier: "MainHome1")
            UIApplication.shared.keyWindow?.rootViewController = mainVC
        }
    }
    
    @IBAction func authSignupBTNTap(_ sender: Any) {
        
    }
    
    //자동로그인, 아이디저장 셀렉트 버튼.
    func ButonAction(){
        
        self.BTNautoLogin.setImage(UIImage(named: "checkbox_selected_20"), for: .selected)
        self.BTNautoLogin.setImage(UIImage(named: "checkbox_select_20"), for: .normal)
        
        self.BTNautoLogin.isSelected = true
        
        self.BTNsaveId.setImage(UIImage(named: "checkbox_selected_20"), for: .selected)
        self.BTNsaveId.setImage(UIImage(named: "checkbox_select_20"), for: .normal)
        
        
        BTNautoLogin.addTarget(self, action: #selector(actionButton(sender:)), for: .touchUpInside)
        BTNsaveId.addTarget(self, action: #selector(actionButton(sender:)), for: .touchUpInside)
    }
    
    @objc func actionButton(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        print("buttonTag -> \(sender.tag)")
    }

//SNSLogIn - KakaoTalk
    @IBAction func log_KakaoBTNTap(_ sender: Any) {
        
        AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            print("oauthToken",oauthToken?.accessToken)
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")

                let _ = oauthToken
            }
        }
    }
    
//SNSLogIn - facebook
    @IBAction func log_FaceBookBTNTap(_ sender: Any) {
        
        let fbLoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            } else if result?.isCancelled == true {
                
                return 
            }
            
            guard let accessToken = AccessToken.current else {
                print("Failed to get access token")
                return
            }
        
            AuthNetwok.facebookLoginNetwork(userId: accessToken.userID, accessToken: accessToken.tokenString) {
               
                 let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                 let mainVC = mainStoryboard.instantiateViewController(identifier: "MainHome1")
                
                 UIApplication.shared.keyWindow?.rootViewController = mainVC
            }
        }
    }
    
//SNSLogIn - google
    @IBAction func log_GoogleBTNTap(_ sender: Any) {
        
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @objc func handleAuthorizationAppleIDButtonPress(){
        
        let appleIdProvider = ASAuthorizationAppleIDProvider()
        let request = appleIdProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding{

     
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            let userIdentifier = appleIDCredential.user
            let userFirstName = appleIDCredential.fullName?.givenName
            let userLastName = appleIDCredential.fullName?.familyName
            let userEmail = appleIDCredential.email
            
        } else if let passwordCredential = authorization.credential as? ASPasswordCredential {
            
            let username = passwordCredential.user
            let password = passwordCredential.password
            
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        
        return self.view.window!
    }
}



