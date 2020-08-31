//
//  DetailThumbTableViewController.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/15.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

let imgWithThumb = "imgWithThumb"
let optionThumb = "optionThumb"
let footerDetail = "footerDetail"
let deliveryDetail = "deliveryDetail"
let detailImages = "detailImages"

class DetailThumbTableViewController: UITableViewController {
    
    var source: ProductThumb?
    
    var currentIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.sectionFooterHeight = UITableView.automaticDimension
        
        self.tableView.register(DetailBuyAndWish.self, forHeaderFooterViewReuseIdentifier: footerDetail)
        self.tableView.register(DetailImgThumbnailTableViewCell.self, forCellReuseIdentifier: imgWithThumb)
        self.tableView.register(DetailOptionTableViewCell.self, forCellReuseIdentifier: optionThumb)
        self.tableView.register(DetailDeliveryTableViewCell.self, forCellReuseIdentifier: deliveryDetail)
        self.tableView.register(DetailImagesTableViewCell.self, forCellReuseIdentifier: detailImages)
        
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        } else if section == 1{
            return source?.detailImages?.count ?? 0
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                
                if let cell = tableView.dequeueReusableCell(withIdentifier: imgWithThumb, for: indexPath) as? DetailImgThumbnailTableViewCell {
                    
                    cell.productBrand.text = source?.thumbBrand
                    cell.productDetail.text = source?.thumbProduct
                    cell.productPrice.text = "\(source!.thumbPrice)원"
                    
                    cell.productPercent.text = source?.thumbPercent
                    
                    cell.selectionStyle = .none
                    
                    if let exprice = source?.thumbExPrice{
                        
                        let attributedString = NSMutableAttributedString(string: exprice)
                        
                        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range:NSRange(location: 0, length: exprice.count))
                        cell.productExPrice.attributedText = attributedString
                        
                    } else {
                        
                        cell.productExPrice.attributedText = nil
                    }
                    
                    cell.collectionView.dataSource = self
                    cell.collectionView.delegate = self
                    
                    return cell
                }
            } else if indexPath.row == 1 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: optionThumb, for: indexPath) as! DetailOptionTableViewCell
                
                cell.dropDownView.titleArray = source?.sizeOptions
               
                cell.totalValue.text = "\(source?.thumbPrice)원"
                cell.selectionStyle = .none
                
                return cell 
            } else if indexPath.row == 2{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: deliveryDetail, for: indexPath) as! DetailDeliveryTableViewCell
                
                cell.selectionStyle = .none
                
                return cell
            }
        } else if indexPath.section == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: detailImages, for: indexPath) as! DetailImagesTableViewCell
            
            cell.imagePath = source?.detailImages?[indexPath.row]
            cell.selectionStyle = .none
            
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        var footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerDetail) as? DetailBuyAndWish
        
        footer?.valueChangeEventCallBack = { (index) in
            self.currentIndex = index!
            self.tableView.reloadData()
        }
        return footer
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
            return 60
        } else {
            return CGFloat.leastNormalMagnitude
        }
    }
}


let photoCollectionCell = "photoCollectionCell"

extension DetailThumbTableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return source?.imageCollec?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCollectionCell, for: indexPath) as! PhotosDetailCollectionViewCell
        
        guard let items = source?.imageCollec else {
            return cell
        }
    
        cell.photoView.kf.setImage(with: URL(string: items[indexPath.item]))
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let items = source?.imageCollec else {
            return
        }
    }
}
