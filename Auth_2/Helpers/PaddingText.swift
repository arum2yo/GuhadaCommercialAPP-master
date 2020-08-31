//
//  PaddingLable.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/10.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import UIKit

class PaddingText: UITextField{
    
    @IBInspectable var topInset: CGFloat = 15.0
    @IBInspectable var bottomInset: CGFloat = 14.0
    @IBInspectable var leftInset: CGFloat = 15.0
    @IBInspectable var rightInset: CGFloat = 5.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            
            return contentSize
        }
    }
}
