//
//  ForgetPWDViewController.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/07.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import SnapKit


class ForgetPWDViewController: BaseViewController {

    @IBOutlet var btnFIndID: UIButton!{
        didSet{
            self.btnFIndID.layer.borderWidth = 1
            self.btnFIndID.layer.borderColor = UIColor(red: 93.0 / 255.0, green: 46.0 / 255.0, blue: 209.0 / 255.0, alpha: 1.0).cgColor
        }
    }
    @IBOutlet var btnResetPwd: UIButton!{
        didSet{
            self.btnResetPwd.layer.borderWidth = 1
            self.btnResetPwd.layer.borderColor = UIColor(white: 204.0 / 255.0, alpha: 1.0).cgColor //grey
            
        }
    }
    @IBOutlet var authName: PaddingText!{
        didSet{
            
            authName.layer.borderWidth = 1
            authName.layer.borderColor = UIColor(white: 238.0 / 255.0, alpha: 1.0).cgColor
            authName.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        }
    }
    @IBOutlet weak var authEmail: PaddingText!{
        didSet{
            authEmail.layer.borderWidth = 1
            authEmail.layer.borderColor = UIColor(white: 238.0 / 255.0, alpha: 1.0).cgColor
            authEmail.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        }
    }
    @IBOutlet var findIdBTN: UIButton!
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func findPWDBtnTap(_ sender: Any) {
        
        print(authEmail.text!)
            
            AuthNetwok.forgetPWD(email: self.authEmail.text!, view: self){
               
                AlertService.alert(title: "Success", msg: "Please check your email", view: self){
                    
                    if let navi = self.navigationController{
                        
                        navi.popViewController(animated: true)
                    }
                }
            }
        }
    
    @IBAction func naviBackBtnTap(_ sender: Any) {
        
        if let navi = self.navigationController{
            
            navi.popViewController(animated: true)
        }
    }
}
