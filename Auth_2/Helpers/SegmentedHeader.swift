//
//  SegmentedHeader.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/15.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import SnapKit

class SegmentedHeader: UIControl {
    var button1: UnderLineButton!
    var button2: UnderLineButton!
    var button3: UnderLineButton!
    var button4: UnderLineButton!
    
    var uLine: UIView = UIView()
    
    var selectedIndex: Int = 0
    
    override init(frame: CGRect){
        super.init(frame: frame)
        layoutInit()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        layoutInit()
    }
    
    private func layoutInit(){
        
        button1 = makeButton(title: "홈", tag: 0)
        button2 = makeButton(title: "타임딜", tag: 1)
        button3 = makeButton(title: "기획전", tag: 2)
        button4 = makeButton(title: "회원정보", tag: 3)
        
        button1.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(button2.snp.width)
        }
        
        button2.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(button1.snp.trailing)
            make.width.equalTo(button3.snp.width)
        }
        
        button3.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(button2.snp.trailing)
            make.width.equalTo(button4)
        }
        
        button4.snp.makeConstraints { (make) in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(button3.snp.trailing)
        }
        
        self.addSubview(uLine)
        uLine.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(2)
            make.width.equalTo(button1)
        }
        
        uLine.backgroundColor = UIColor(red: 93.0 / 255.0, green: 46.0 / 255.0, blue: 209.0 / 255.0, alpha: 1.0)
        
    }
    
    private func makeButton(title: String, tag: Int) -> UnderLineButton{
        
        let button = UnderLineButton()
        self.addSubview(button)
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(white: 17.0 / 255.0, alpha: 1.0), for: .normal)
        button.setTitleColor(UIColor(red: 93.0 / 255.0, green: 46.0 / 255.0, blue: 209.0 / 255.0, alpha: 1.0), for: .selected)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        
        
        button.tag = tag
        
        button.addTarget(self, action: #selector(actionSegEvent(sender:)), for: .touchUpInside)
        
        return button
    }
    
    //MARK:- button Events
    
    @objc func actionSegEvent(sender:UnderLineButton){
        button1.isSelected = sender == button1
        button2.isSelected = sender == button2
        button3.isSelected = sender == button3
        button4.isSelected = sender == button4
        
        for (i,v) in subviews.enumerated(){
            
            if let button = v as? UnderLineButton{
                button.isSelected = button == sender
                if button.isSelected{
                    selectedIndex = i
                }
            }
        }
        
        self.sendActions(for: .valueChanged)
        
        self.uLine.snp.remakeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(2)
            make.leading.trailing.equalTo(sender)
        }
        
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }
}

class UnderLineButton: UIButton{
    
    var underLine: UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initLayout()
    }
    
    private func initLayout(){
        
        self.addSubview(underLine)
        underLine.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(2)
        }
        underLine.backgroundColor = UIColor.clear
    }
}
