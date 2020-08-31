//
//  DetailImgThumbnailTableViewCell.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/16.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class DetailImgThumbnailTableViewCell: UITableViewCell {
    
    var collectionView: UICollectionView!
    
    var productBrand = UILabel()
    var productDetail = UILabel()
    var productPrice = UILabel()
    var productExPrice = UILabel()
    var productPercent = UILabel()
    
    var buttonView = UIView()
    var productShard = UIButton()
    var productLiked = UIButton()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initLayout()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initLayout()
    }
    
    func initLayout(){
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        self.contentView.addSubview(collectionView)
        
        collectionView.backgroundColor = UIColor.white
       
        collectionView.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(375)
        }
        
        collectionView.register(PhotosDetailCollectionViewCell.self, forCellWithReuseIdentifier: photoCollectionCell)
        
        self.contentView.addSubview(productBrand)
        self.contentView.addSubview(productDetail)
        self.contentView.addSubview(productPrice)
        self.contentView.addSubview(productExPrice)
        self.contentView.addSubview(productPercent)
        self.contentView.addSubview(buttonView)
        buttonView.addSubview(productShard)
        buttonView.addSubview(productLiked)
        
        self.contentView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        productBrand.snp.makeConstraints { (make) in
            make.leading.equalTo(self.contentView.layoutMargins)
            make.top.equalTo(collectionView.snp.bottom).offset(30)
            make.height.greaterThanOrEqualTo(0)
        }
        productBrand.textColor = UIColor(white: 17.0 / 255.0, alpha: 1.0)
        productBrand.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        
        productDetail.snp.makeConstraints { (make) in
            make.leading.equalTo(productBrand.snp.leading)
            make.top.equalTo(productBrand.snp.bottom).offset(12)
            make.height.greaterThanOrEqualTo(0)
            
            make.trailing.equalTo(self.contentView.layoutMargins)
        }
        productDetail.numberOfLines = 2
        productDetail.textColor = UIColor(white: 17.0 / 255.0, alpha: 1.0)
        productDetail.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 18)
        
        productPrice.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.contentView.layoutMargins)
            make.leading.equalTo(productDetail.snp.leading)
            make.top.equalTo(productDetail.snp.bottom).offset(16)
            make.height.greaterThanOrEqualTo(0)
        }
        productPrice.textColor = UIColor(white: 17.0 / 255.0, alpha: 1.0)
        productPrice.font = UIFont(name: "AppleSDGothicNeo-ExtraBold", size: 24)
        
        productExPrice.snp.makeConstraints { (make) in
            make.bottom.equalTo(productPrice.snp.bottom)
            make.leading.equalTo(productPrice.snp.trailing).offset(15)
            make.height.greaterThanOrEqualTo(0)
        }
        productExPrice.textColor = UIColor(white: 119.0 / 255.0, alpha: 1.0)
        productExPrice.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 11)
        
        
        productPercent.snp.makeConstraints { (make) in
            make.bottom.equalTo(productExPrice.snp.bottom)
            make.leading.equalTo(productExPrice.snp.trailing).offset(11)
            make.height.greaterThanOrEqualTo(0)
        }
        productPercent.textColor = UIColor(red: 93.0 / 255.0, green: 46.0 / 255.0, blue: 209.0 / 255.0, alpha: 1.0)
        productPercent.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        
        buttonView.snp.makeConstraints { (make) in
            make.bottom.equalTo(productPercent.snp.bottom)
            make.leading.equalTo(productPercent.snp.trailing).offset(109)
            make.trailing.equalTo(self.contentView.layoutMargins)
            make.height.width.equalTo(30)
        }
        
        productLiked.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        productLiked.setImage(UIImage(named: "하트-1"), for: .normal)
        productLiked.setImage(UIImage(named: "하트"), for: .selected)
        productLiked.addTarget(self, action: #selector(actionLikeButton(sender:)), for: .touchUpInside)
        
    }
    
    @objc func actionLikeButton(sender: UIButton){
        sender.isSelected = !sender.isSelected
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class PhotosDetailCollectionViewCell: UICollectionViewCell{
    
    var photoView = UIImageView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        initLayout()
    }
    
    private func initLayout(){
        
        self.contentView.addSubview(photoView)
        photoView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            
        }
    }
}
