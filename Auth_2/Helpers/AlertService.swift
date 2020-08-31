//
//  AlertService.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/07.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import UIKit

class AlertService{
    
    static func alert(title: String, msg: String, view: UIViewController, completion:@escaping()->Void){
        
        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let cancelBTN =  UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        alertVC.addAction(cancelBTN)
        
        view.present(alertVC, animated: true, completion: nil)
    }
}
