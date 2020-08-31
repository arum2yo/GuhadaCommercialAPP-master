//
//  DetailDeliveryTableViewCell.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/23.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class DetailDeliveryTableViewCell: UITableViewCell {
    
    var deliveryLable1 = UILabel()
    var deliveryLable2 = UILabel()
    
    var separateLine1 = UIView()
    
    var pointLable1 = UILabel()
    var pointLable2 = UILabel()
    
    var separateLine2 = UIView()
    
    var bonusLable1 = UILabel()
    var bonusLable2 = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        initLayout()
    }
    
    private func initLayout(){
        
        self.contentView.addSubview(deliveryLable1)
        self.contentView.addSubview(deliveryLable2)
        self.contentView.addSubview(separateLine1)
        self.contentView.addSubview(pointLable1)
        self.contentView.addSubview(pointLable2)
        self.contentView.addSubview(separateLine2)
        self.contentView.addSubview(bonusLable1)
        self.contentView.addSubview(bonusLable2)
        
        self.contentView.layoutMargins = UIEdgeInsets(top: 17, left: 20, bottom: 17, right: 20)
        
        deliveryLable1.snp.makeConstraints { (make) in
            make.top.leading.equalTo(self.contentView.layoutMargins)
            make.height.greaterThanOrEqualTo(0)
        }
        deliveryLable1.text = "배송정보"
        deliveryLable1.textColor = UIColor(white: 17.0 / 255.0, alpha: 1.0)
        deliveryLable1.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 13)
        
        deliveryLable2.snp.makeConstraints { (make) in
            make.leading.equalTo(self.contentView.layoutMargins).offset(100)
            make.bottom.equalTo(deliveryLable1.snp.bottom)
        }
        deliveryLable2.text = "판매자 부담(무료배송)"
        deliveryLable2.textColor = UIColor(white: 68.0 / 255.0, alpha: 1.0)
        deliveryLable2.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 13)
        
        separateLine1.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.leading.trailing.equalTo(self.contentView.layoutMargins)
            make.top.equalTo(deliveryLable1.snp.bottom).offset(17)
        }
        separateLine1.layer.borderWidth = 1
        separateLine1.layer.borderColor = UIColor(white: 238.0 / 255.0, alpha: 1.0).cgColor
        
        pointLable1.snp.makeConstraints { (make) in
            make.leading.equalTo(separateLine1.snp.leading)
            make.top.equalTo(separateLine1.snp.bottom).offset(17)
            make.height.greaterThanOrEqualTo(0)
        }
        pointLable1.text = "포인트적립"
        pointLable1.textColor = UIColor(white: 17.0 / 255.0, alpha: 1.0)
        pointLable1.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 13)
        
        pointLable2.snp.makeConstraints { (make) in
            make.leading.equalTo(self.contentView.layoutMargins).offset(100)
            make.top.equalTo(pointLable1.snp.top)
            make.height.greaterThanOrEqualTo(0)
        }
        pointLable2.numberOfLines = 3
        pointLable2.text = "구매확정 시 500원 적립\n리뷰 작성 시 최대 2,000원 적립\n첫 구매시 추가 10,000원 적립"
        pointLable2.textColor = UIColor(white: 68.0 / 255.0, alpha: 1.0)
        pointLable2.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 13)
        
        separateLine2.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.leading.trailing.equalTo(self.contentView.layoutMargins)
            make.top.equalTo(pointLable2.snp.bottom).offset(17)
        }
        separateLine2.layer.borderWidth = 1
        separateLine2.layer.borderColor = UIColor(white: 238.0 / 255.0, alpha: 1.0).cgColor
        
        bonusLable1.snp.makeConstraints { (make) in
            make.leading.equalTo(separateLine2.snp.leading)
            make.top.equalTo(separateLine2.snp.bottom).offset(17)
            make.bottom.equalTo(self.contentView.layoutMargins)
        }
        bonusLable1.text = "무이자 할부"
        bonusLable1.textColor = UIColor(white: 17.0 / 255.0, alpha: 1.0)
        bonusLable1.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 13)
        
        bonusLable2.snp.makeConstraints { (make) in
            make.bottom.equalTo(bonusLable1.snp.bottom)
            make.leading.equalTo(self.contentView.layoutMargins).offset(100)
        }
        bonusLable2.text = "5만원 이상 무이자"
        bonusLable2.textColor = UIColor(white: 68.0 / 255.0, alpha: 1.0)
        bonusLable2.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 13)
    }
    
}
