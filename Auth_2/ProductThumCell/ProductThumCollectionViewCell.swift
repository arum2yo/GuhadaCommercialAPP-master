//
//  ProductThumCollectionViewCell.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/13.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class ProductThumCollectionViewCell: UICollectionViewCell {
    @IBOutlet var thumbImage: UIImageView!
    @IBOutlet var thumb_a_Brand: UILabel!
    @IBOutlet var thumb_b_product: UILabel!
    @IBOutlet var thumb_c_Price: UILabel!
    @IBOutlet var thumb_d_exPrice: UILabel!{
        didSet{
            let attributedString = NSMutableAttributedString(string: thumb_d_exPrice.text!)
            
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1,
                                          range:NSRange(location: 0, length: thumb_d_exPrice.text!.count))
        }
    }
    
    @IBOutlet var thumbConstraint: NSLayoutConstraint!
    
    @IBOutlet var thumb_e_Percent: UILabel!
    @IBOutlet var thumb_f_seller: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
