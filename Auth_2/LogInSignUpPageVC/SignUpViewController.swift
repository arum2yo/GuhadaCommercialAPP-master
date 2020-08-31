//
//  SignUpViewController.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/05.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import Moya

class SignUpViewController: BaseViewController {
    
    @IBOutlet weak var authName: UITextField!{
        didSet{
            authName.placeholder = "이름"
            authName.layer.borderWidth = 1
            authName.layer.borderColor = authBorder
            authName.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        }
    }
    @IBOutlet weak var authEmail: UITextField!{
        didSet{
            authEmail.placeholder = "이메일주소"
            authEmail.layer.borderWidth = 1
            authEmail.layer.borderColor = authBorder
            authEmail.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
            
        }
    }
    @IBOutlet weak var authPassword: UITextField!{
        didSet{
            authPassword.placeholder = "비밀번호 (영문, 숫자, 특수문자 조합하여 8~15자리"
            authPassword.layer.borderWidth = 1
            authPassword.layer.borderColor = authBorder
            authPassword.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        }
    }
    @IBOutlet weak var authPassCHK: UITextField!{
        didSet{
            authPassCHK.placeholder = "비밀번호 확인"
            authPassCHK.layer.borderWidth = 1
            authPassCHK.layer.borderColor = authBorder
            authPassCHK.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        }
    }
    
    @IBOutlet weak var BTN_agree: UIButton!
    @IBOutlet weak var BTN_strongNotice: UIButton!
    @IBOutlet weak var BTN_buyNotice: UIButton!
    @IBOutlet weak var BTN_personalNoti: UIButton!
    @IBOutlet weak var BTN_selecNoti: UIButton!
    
    @IBOutlet weak var signUpBTN: UIButton!{
        didSet{
            signUpBTN.layer.backgroundColor = UIColor(red: 183.0 / 255.0, green: 190.0 / 255.0, blue: 196.0 / 255.0, alpha: 1.0).cgColor
        }
    }
    
    let authBorder = UIColor(white: 238.0 / 255.0, alpha: 1.0).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.actionBUTTON()
        
    }
    
    @IBAction func signUPBTNTap(_ sender: Any) {
        
        AuthNetwok.registerNetwork(name: self.authName.text!, email: self.authEmail.text!, password: self.authPassword.text!, view: self) {msg in
            
            let alertVC = UIAlertController(title: "회원가입", message: msg, preferredStyle: .alert)
            let alertAct = UIAlertAction(title: "로그인하러가기", style: .default) { (_) in
                if let navi = self.navigationController {
                    navi.popViewController(animated: true)
                }
            }
            
            let gotoEmail = UIAlertAction(title: "chk email", style: .default) { (_) in
                if let url = URL(string: "https://www.naver.com") {
                    UIApplication.shared.open(url, options: [:])
                }
            }
            alertVC.addAction(alertAct)
            alertVC.addAction(gotoEmail)
            self.present(alertVC, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func backBTN(_ sender: Any) {
        
        let loginVC = self.storyboard?.instantiateViewController(identifier: "loginVC")
        UIApplication.shared.keyWindow?.rootViewController = loginVC
    }
    
    func actionBUTTON(){
        
        self.BTN_agree.setImage(UIImage(named: "checkbox_selected_28"), for: .selected)
        self.BTN_agree.setImage(UIImage(named: "checkbox_select_28"), for: .normal)
        self.BTN_agree.addTarget(self, action: #selector(actionBTN(sender:)), for: .touchUpInside)
        
        self.BTN_strongNotice.setImage(UIImage(named: "checkbox_selected_20"), for: .selected)
        self.BTN_strongNotice.setImage(UIImage(named: "checkbox_select_20"), for: .normal)
        self.BTN_strongNotice.addTarget(self, action: #selector(actionBTN(sender:)), for: .touchUpInside)
        
        self.BTN_buyNotice.setImage(UIImage(named: "checkbox_selected_20"), for: .selected)
        self.BTN_buyNotice.setImage(UIImage(named: "checkbox_select_20"), for: .normal)
        self.BTN_buyNotice.addTarget(self, action: #selector(actionBTN(sender:)), for: .touchUpInside)
        
        self.BTN_personalNoti.setImage(UIImage(named: "checkbox_selected_20"), for: .selected)
        self.BTN_personalNoti.setImage(UIImage(named: "checkbox_select_20"), for: .normal)
        self.BTN_personalNoti.addTarget(self, action: #selector(actionBTN(sender:)), for: .touchUpInside)
        
        self.BTN_selecNoti.setImage(UIImage(named: "checkbox_selected_20"), for: .selected)
        self.BTN_selecNoti.setImage(UIImage(named: "checkbox_select_20"), for: .normal)
        self.BTN_selecNoti.addTarget(self, action: #selector(actionBTN(sender:)), for: .touchUpInside)
        
    }
    
    
    @objc func actionBTN(sender: UIButton){
        
        sender.isSelected = !sender.isSelected
    }
}
