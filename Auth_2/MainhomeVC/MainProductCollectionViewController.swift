//
//  MainProductCollectionViewController.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/13.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import Kingfisher

let productCell = "productCell"

class MainProductCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var headerIndex: Int = 0
    var headerType: NSObject.Type!
    
    var products = [
        ProductThumb.item1(),
        ProductThumb.item2(),
        ProductThumb.item3(),
        ProductThumb.item4(),
        ProductThumb.item5(),
        ProductThumb.item6(),
        ProductThumb.item7(),
        ProductThumb.item8(),
        ProductThumb.item9(),
        ProductThumb.item10()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 7.0
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        self.collectionView.register(UINib(nibName: "ProductThumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: productCell)
    }
    
    //MARK:- Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            
            let dest = segue.destination as! DetailThumbTableViewController
            dest.source = sender as? ProductThumb
        }
    }
    
    // MARK:- UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return products.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCell, for: indexPath) as! ProductThumCollectionViewCell
        
        let product = products[indexPath.item]
        
        cell.thumb_a_Brand.text = product.thumbBrand
        cell.thumb_b_product.text = product.thumbProduct
        cell.thumb_c_Price.text = product.thumbPrice
        cell.thumb_e_Percent.text = product.thumbPercent
        cell.thumb_f_seller.text = product.thumbSeller
        cell.thumbImage.kf.setImage(with: URL(string: product.thumbImagePath))
        
        if let price = product.thumbExPrice{
            
            let attributedString = NSMutableAttributedString(string: price)
            attributedString.addAttribute(NSMutableAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: price.count))
            cell.thumb_d_exPrice.attributedText = attributedString
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = products[indexPath.item]
        self.performSegue(withIdentifier: "showDetail", sender: item)
    }
    
    // MARK:- UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 174, height: 307)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        
        return CGSize(width: 375, height: 500)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "productReuse", for: indexPath) as? ProductMainCollectionReusableView else {
                    fatalError("Invalid view type")
            }
            
            headerView.headerIMG.image = UIImage(named: "이미지 161")
            headerView.headerLable.text = "PREMIUM ITEM"
            
            return headerView
        default:
            assert(false, "Invalid element type")
        }
    }
}









