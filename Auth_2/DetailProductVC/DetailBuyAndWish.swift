//
//  DetailBuyAndWish.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/23.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class DetailBuyAndWish: UITableViewHeaderFooterView {
    
    var wishBTN = UIButton()
    var buyBTN = UIButton()
    
    var valueChangeEventCallBack: ((Int?) -> Void)?
    var selectedIndex: Int?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initLayout()
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        initLayout()
    }
    
    private func initLayout(){
        
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(60)
        }
        
        self.contentView.addSubview(wishBTN)
        self.contentView.addSubview(buyBTN)
        
        wishBTN.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(buyBTN.snp.width)
        }
        
        buyBTN.snp.makeConstraints { (make) in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(wishBTN.snp.trailing)
            make.width.equalTo(wishBTN.snp.width)
        }
        
        wishBTN.setTitleColor(UIColor(white: 1.0, alpha: 1.0), for: .normal)
        wishBTN.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 18)
        wishBTN.setTitle("장바구니", for: .normal)
        wishBTN.backgroundColor = UIColor(white: 68.0 / 255.0, alpha: 1.0)
        
        buyBTN.setTitleColor(UIColor(white: 1.0, alpha: 1.0), for: .normal)
        buyBTN.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 18)
        buyBTN.setTitle("바로구매", for: .normal)
        buyBTN.backgroundColor = UIColor(red: 93.0 / 255.0, green: 46.0 / 255.0, blue: 209.0 / 255.0, alpha: 1.0)
        
        wishBTN.isSelected = true
        wishBTN.addTarget(self, action: #selector(footerWishBuy(sender:)), for: .touchUpInside)
        buyBTN.addTarget(self, action: #selector(footerWishBuy(sender:)), for: .touchUpInside)
    }
    
    @objc func footerWishBuy(sender: UIButton){
        print(sender)
        for (i,v) in contentView.subviews.enumerated(){
            
            if let button = v as? UIButton{
                button.isSelected = button == sender
                if button.isSelected{
                    selectedIndex = i
                }
            }
        }
        self.valueChangeEventCallBack?(selectedIndex)
    }
}
