//
//  MainHomeViewController.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/13.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import SnapKit

class MainHomeViewController: UIViewController {
    
    var segmentHeader: SegmentedHeader = SegmentedHeader()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let logoImage = UIImage.init(named: "logo_guhada")
        let logoImageView = UIImageView.init(image: logoImage)
        
        logoImageView.frame = CGRect(x:40.0,y:36.0, width:110,height:30)
        logoImageView.contentMode = .scaleAspectFill
        
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        
        let widthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: 110)
        let heightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: 30)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        navigationItem.leftBarButtonItem =  imageItem
        
        self.view.addSubview(segmentHeader)
        segmentHeader.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        segmentHeader.addTarget(self, action: #selector(actionHeaderIndexChanged(sender:)), for: .valueChanged)
        
        let vc1 = viewControll(identifier: "MainHome2", isHidden: false) as? MainProductCollectionViewController
        let vc2 = viewControll(identifier: "MainHome3", isHidden: true) as? TimeDealPageTableViewController
        let vc3 = viewControll(identifier: "MainHome4", isHidden: true) as? EventViewController
        let vc4 = viewControll(identifier: "MainHome5", isHidden: true) as? MyAccountViewController
        
        actionHeaderIndexChanged(sender: segmentHeader)
        
    }
    
    @IBAction func logOutBTNTap(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "token") //자동로그인된 토큰 삭제해주는 기능
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = mainStoryboard.instantiateViewController(identifier: "FirstNavi") //삭제하고 첫 화면을 firstNavi로 가게함.
        UIApplication.shared.keyWindow?.rootViewController = mainVC
        
    }
    
    func viewControll(identifier: String, isHidden: Bool) -> UIViewController?{
        
        if let collectionVC = storyboard?.instantiateViewController(identifier: identifier){
            
            self.addChild(collectionVC)
            self.view.addSubview(collectionVC.view)
            collectionVC.view.isHidden = isHidden
            
            let v = collectionVC.view
            v?.snp.makeConstraints({ (make) in
                make.top.equalTo(segmentHeader.snp.bottom)
                make.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
            })
            return collectionVC
        }
        return nil
    }
    
    
    //MARK:- Control Event
    
    @objc func actionHeaderIndexChanged(sender: SegmentedHeader){
        
        for (i, vc) in children.enumerated(){
            let hidden = sender.selectedIndex != i
            vc.view.isHidden = hidden
            if hidden == false{
                self.navigationItem.backBarButtonItem = vc.navigationItem.backBarButtonItem
            }
        }
    }
}
