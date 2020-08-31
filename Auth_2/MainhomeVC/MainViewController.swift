//
//  MainViewController.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/06.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logOutBTNTap(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "token")
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = mainStoryboard.instantiateViewController(identifier: "FirstNavi")
        UIApplication.shared.keyWindow?.rootViewController = mainVC        
    }
    
}
