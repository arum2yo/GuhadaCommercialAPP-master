//
//  DetailImagesTableViewCell.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/23.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class DetailImagesTableViewCell: UITableViewCell {
    
    var images = UIImageView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        awakeFromNib()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.addSubview(images)
        images.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(400)
        }
    }
    var imageHeigth:CGFloat = 0 {
        didSet{
            images.snp.updateConstraints { (make) in
                make.height.equalTo(imageHeigth)
            }
        }
    }
    
    var imagePath : String? = nil{
        didSet{
            if let path = imagePath{
                images.kf.setImage(
                    with: URL(string: path)!,
                    placeholder: nil,
                    options: nil)
                {
                    result in
                    switch result{
                    case.success(let value):
                        self.imageHeigth = value.image.size.height
                    case.failure(let error):
                        self.imageHeigth = self.bounds.width
                    }
                    self.setNeedsLayout()
                }
            }
        }
    }
}
