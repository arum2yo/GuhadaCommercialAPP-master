//
//  MyAccountViewController.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/26.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON

class MyAccountViewController: UIViewController {
    
    var provider = MoyaProvider<AuthService>()
    var user = [User]()
    
    @IBOutlet var account: UILabel!
    @IBOutlet var profileIMG: UIImageView!
    @IBOutlet var accountName: UILabel!
    @IBOutlet var accountName_text: UITextField!{
        didSet{
            accountName_text.layer.borderWidth = 1
            accountName_text.layer.borderColor = UIColor(white: 238.0 / 255.0, alpha: 1.0).cgColor
            accountName_text.layer.backgroundColor = UIColor(red: 249.0 / 255.0, green: 249.0 / 255.0, blue: 250.0 / 255.0, alpha: 1.0).cgColor
            accountName_text.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        }
    }
    @IBOutlet var accountEmail: UILabel!
    @IBOutlet var accountEmail_text: UITextField!{
        didSet{
            accountEmail_text.layer.borderWidth = 1
            accountEmail_text.layer.borderColor = UIColor(white: 238.0 / 255.0, alpha: 1.0).cgColor
            accountEmail_text.layer.backgroundColor = UIColor(white: 1.0, alpha: 1.0).cgColor
            accountEmail_text.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        }
    }
    @IBOutlet var accountLocation: UILabel!
    @IBOutlet var accountLocation_text: UITextField!{
        didSet{
            accountLocation_text.layer.borderWidth = 1
            accountLocation_text.layer.borderColor = UIColor(white: 238.0 / 255.0, alpha: 1.0).cgColor
            accountLocation_text.layer.backgroundColor = UIColor(white: 1.0, alpha: 1.0).cgColor
            accountLocation_text.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("tokenAccount", UserDefaults.standard.string(forKey: "userId"))
        
        let userId = UserDefaults.standard.string(forKey: "userId")
        let token = UserDefaults.standard.string(forKey: "token")
        
    }
    @IBAction func cancleBtnTab(_ sender: Any) {
    }
    @IBAction func modifyBtnTab(_ sender: Any) {
    }
}
