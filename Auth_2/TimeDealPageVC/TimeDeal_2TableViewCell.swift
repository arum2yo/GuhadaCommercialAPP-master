//
//  TimeDeal_2TableViewCell.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/26.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class TimeDeal_2TableViewCell: UITableViewCell {


    @IBOutlet var time1line_1: UILabel!{
        didSet{
            self.time1line_1.layer.masksToBounds = true
            self.time1line_1.layer.cornerRadius = 8
        }
    }
    @IBOutlet var time1line_dday: UILabel!{
        didSet{
            
            
        }
    }
    @IBOutlet var timeImgCont: UIImageView!
    @IBOutlet var timeBrand: UILabel!
    @IBOutlet var timeSeason: UILabel!
    @IBOutlet var timeDetail: UILabel!
    @IBOutlet var timeDiscount: UILabel!
    @IBOutlet var timeExprice: UILabel!{
        didSet{
            let attributedString = NSMutableAttributedString(string: "3,200,000")
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: 8))
            timeExprice.attributedText = attributedString
        }
    }
    @IBOutlet var timePrice: UILabel!
    @IBOutlet var timeSoldOut: UILabel!
    
    

    @IBOutlet var line2: UIView!
    @IBOutlet var line3: UIView!
    @IBOutlet var line4: UIView!
    
    var expireDate = Date()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.timeImgCont.image = UIImage(named: "0ebbdd04848efd93dc74cb005d3ad567")
    }
    
    func d_dayFormat(){
        
        let strDate = "2020-09-29"
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.expireDate = dateFormatter.date(from: strDate)!
    }
    
}
