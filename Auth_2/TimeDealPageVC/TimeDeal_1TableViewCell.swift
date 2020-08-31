//
//  TimeDeal_1TableViewCell.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/26.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class TimeDeal_1TableViewCell: UITableViewCell {

    var TimeDealImg = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.addSubview(TimeDealImg)
        TimeDealImg.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(320)
        }
        
        self.TimeDealImg.image = UIImage(named: "timedeal_top_320")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
