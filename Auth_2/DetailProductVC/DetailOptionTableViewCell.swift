//
//  DetailOptionTableViewCell.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/18.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit


class DetailOptionTableViewCell: UITableViewCell {

   
    var optionSelect = UILabel()
    var dropDownView = DropDownView()
    var stockView = UIView()
    var btn_Minus = UIButton()
    var btn_plus = UIButton()
    var stockCount = UILabel()
    var totalPrice = UILabel()
    var totalValue = UILabel()
    
    var number: Int = 1

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layoutInit()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutInit()
    }
    
    func layoutInit(){
        
        contentView.addSubview(optionSelect)
        contentView.addSubview(dropDownView)
        
        contentView.addSubview(stockView)
        stockView.addSubview(btn_Minus)
        stockView.addSubview(btn_plus)
        stockView.addSubview(stockCount)
        
        contentView.addSubview(totalPrice)
        contentView.addSubview(totalValue)
        
        optionSelect.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview().inset(20)
            make.height.greaterThanOrEqualTo(0)
        }
        
        optionSelect.text = "옵션선택"
        optionSelect.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 16)
        optionSelect.textColor = UIColor(white: 17.0 / 255.0, alpha: 1.0)
        
        dropDownView.snp.makeConstraints { (make) in
            make.leading.equalTo(optionSelect.snp.leading)
            make.trailing.equalTo(optionSelect.snp.trailing)
            make.top.equalTo(optionSelect.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        dropDownView.addTarget(self, action: #selector(selecSizeBTN), for: .touchUpInside)
        dropDownView.setTitle("  사이즈", for: .normal)
        dropDownView.contentHorizontalAlignment = .leading
        
        let layer = dropDownView.layer
        layer.borderColor = UIColor(white: 238.0 / 255.0, alpha: 1.0).cgColor
        layer.borderWidth = 1
        
        stockView.snp.makeConstraints { (make) in
            make.leading.equalTo(dropDownView.snp.leading)
            make.top.equalTo(dropDownView.snp.bottom).offset(20)
            make.width.equalTo(120)
            make.height.greaterThanOrEqualTo(0)
        }
        
        btn_Minus.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(32)
        }
        btn_Minus.setImage(UIImage(named: "detail_btn_quantity_minus_off"), for: .normal)
        btn_Minus.setImage(UIImage(named: "minus_icon"), for: .selected)
        btn_Minus.layer.borderWidth = 1
        btn_Minus.layer.borderColor = UIColor(white: 238.0 / 255.0, alpha: 1.0).cgColor
        btn_Minus.addTarget(self, action: #selector(btnMinus(sender:)), for: .touchUpInside)
        
        stockCount.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(btn_Minus.snp.trailing).offset(23)
        }
        stockCount.text = String(number)
        stockCount.font =  UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        stockCount.textColor = UIColor(white: 17.0 / 255.0, alpha: 1.0)
        
        btn_plus.snp.makeConstraints { (make) in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(stockCount.snp.trailing).offset(23)
        }
        btn_plus.setImage(UIImage(named: "detail_btn_quantity_plus_on"), for: .normal)
        btn_plus.layer.borderWidth = 1
        btn_plus.layer.borderColor = UIColor(white: 238.0 / 255.0, alpha: 1.0).cgColor
        btn_plus.addTarget(self, action: #selector(btnPlus(sender:)), for: .touchUpInside)
        
        totalPrice.snp.makeConstraints { (make) in
            make.leading.equalTo(stockView.snp.leading)
            make.top.equalTo(stockView.snp.bottom).offset(30)
            make.bottom.equalToSuperview().inset(30)
            make.width.greaterThanOrEqualTo(0)
        }
        totalPrice.text = "총 상품금액"
        totalPrice.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        totalPrice.textColor = UIColor(white: 17.0 / 255.0, alpha: 1.0)
        
        totalValue.snp.makeConstraints { (make) in
            make.bottom.equalTo(totalPrice.snp.bottom)
            make.trailing.equalTo(dropDownView.snp.trailing)
            make.width.greaterThanOrEqualTo(0)
        }
        totalValue.font =  UIFont(name: "AppleSDGothicNeo-ExtraBold", size: 24)
        totalValue.textColor = UIColor(red: 93.0 / 255.0, green: 46.0 / 255.0, blue: 209.0 / 255.0, alpha: 1.0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK:- button Event
    
    @objc func selecSizeBTN(){
        dropDownView.becomeFirstResponder()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dropDownView.resignFirstResponder()
        }
    }
  
    @objc func btnMinus(sender: UIButton){
        
        if number > 1 {
            number = number - 1
            
            stockCount.text = "\(number)"
            
        } else {
            btn_Minus.isEnabled = false
        }
    }
    
    @objc func btnPlus(sender: UIButton){
        
        number = number + 1
        stockCount.text = "\(number)"
    }
}

class DropDownView: UIButton, UIPickerViewDataSource, UIPickerViewDelegate{
    
    private let pickerView = UIPickerView()
    
    override var inputView: UIView?{
        
        return pickerView
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder:coder)
        layoutInit()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        layoutInit()
    }
    
    private func layoutInit(){
        
        self.setTitleColor(UIColor(white: 68.0 / 255.0, alpha: 1.0), for: .normal)
        self.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    }
    
    private lazy var accessory: UIToolbar = {
        
        var toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let cancel = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(resignFirstResponder))
        cancel.tintColor = UIColor(white: 17.0 / 255.0, alpha: 1.0)
        
        let choose = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(actionChoose))
        choose.tintColor = UIColor(white: 17.0 / 255.0, alpha: 1.0)
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.items = [cancel, space, choose]
        
        return toolBar
    }()
    
    override var inputAccessoryView: UIView?{
        return accessory
    }
    
    var titleArray:[String]?
    
    override var canBecomeFirstResponder: Bool{
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        return true
    }
    
    //MARK:- UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titleArray?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titleArray?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.setTitle(titleArray?[row], for: .normal)
    }
    
    //MARK:- Button Event
    
    @objc private func actionChoose(){
        self.resignFirstResponder()
    }
    
}
