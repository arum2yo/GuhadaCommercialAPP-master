//
//  EventPageCell.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/26.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import UIKit
import VerticalCardSwiper

class EventPageCell: CardCell{
    
    var eventImg = UIImageView()
    var eventSubject = UILabel()
    var eventDate = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layoutInit()
    }
    private func layoutInit(){
        
        self.contentView.addSubview(eventImg)
        self.contentView.addSubview(eventSubject)
        self.contentView.addSubview(eventDate)
        
        contentView.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        
        eventImg.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(205)
            make.width.equalTo(375)
        }
        
        eventSubject.snp.makeConstraints { (make) in
            make.top.equalTo(eventImg.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
        }
        
        eventDate.snp.makeConstraints { (make) in
            make.top.equalTo(eventSubject.snp.bottom).offset(5)
            make.leading.equalTo(eventSubject.snp.leading)
            make.height.equalTo(15)
        }
        
        eventSubject.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        eventSubject.textColor = UIColor(white: 17.0 / 255.0, alpha: 1.0)
        
        eventDate.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 12)
        eventDate.textColor = UIColor(white: 119.0 / 255.0, alpha: 1.0)
    }
}

