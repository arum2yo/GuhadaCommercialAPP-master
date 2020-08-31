//
//  ProductThumb.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/16.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation

private let image1 = "http://ss070707.cafe24.com/pic/BB881%20(1).jpg"
private let image2 = "http://ss070707.cafe24.com/pic/BB970%20(1).jpg"
private let image3 = "http://ss070707.cafe24.com/pic/aa796%20(1).jpg"
private let image4 = "http://ss070707.cafe24.com/pic/BB791%20(1).jpg"
private let image5 = "http://ss070707.cafe24.com/pic/aa785%20(1).jpg"
private let image6 = "http://ss070707.cafe24.com/pic/BB806%20(1).jpg"
private let image7 = "http://ss070707.cafe24.com/pic/BB881%20(1).jpg"
private let image8 = "http://ss070707.cafe24.com/pic/BB970%20(1).jpg"
private let image9 = "http://ss070707.cafe24.com/pic/aa796%20(1).jpg"
private let image10 = "http://ss070707.cafe24.com/pic/BB791%20(1).jpg"

class ProductThumb: NSObject{
    
    var thumbImagePath: String
    var thumbBrand: String
    var thumbProduct: String
    var thumbPrice: String
    var thumbExPrice: String?
    var thumbPercent: String
    var thumbSeller: String
    
    var detailImages: [String]?
    
    var sizeOptions: [String]?
    var imageCollec : [String]?
    
    var isLike: Bool?
    
    init( _ thumbImagePath: String, _ thumbBrand: String, _ thumbProduct: String, _ thumbPrice: String, _ thumbExPrice: String, _ thumbPercent: String, _ thumbSeller: String){
        
        self.thumbImagePath = thumbImagePath
        self.thumbBrand = thumbBrand
        self.thumbProduct = thumbProduct
        self.thumbPrice = thumbPrice
        self.thumbExPrice = thumbExPrice
        self.thumbPercent = thumbPercent
        self.thumbSeller = thumbSeller
        
    }
    
    static func item1() -> ProductThumb{
        
        let products = ProductThumb(image1, "Stone Island", "[제임스제인/국내]20SS 스톤아일랜드 와펜 네이비 맨투맨", "287000", "299,000", "4%", "제임스제인")
        
        products.imageCollec = [
            "http://ss070707.cafe24.com/pic/BB881%20(1).jpg",
            "http://ss070707.cafe24.com/pic/BB881%20(2).jpg",
            "http://ss070707.cafe24.com/pic/BB881%20(3).jpg",
            "http://ss070707.cafe24.com/pic/BB881%20(4).jpg"
        ]
        
        products.sizeOptions = [
            "  S:Black",
            "  M:Black",
            "  L:Black",
            "  XL:Black",
            "  XXL:Black"
        ]
        
        products.detailImages = [
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/top.png",
            "http://ss070707.cafe24.com/pic/BB881%20(1).jpg",
            "http://ss070707.cafe24.com/pic/BB881%20(2).jpg",
            "http://ss070707.cafe24.com/pic/BB881%20(3).jpg",
            "http://ss070707.cafe24.com/pic/BB881%20(4).jpg",
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/bottom.png"
        ]
        
        return products
        
    }
    
    static func item2() -> ProductThumb{
        
        let products = ProductThumb(image2, "OFF White", "[제임스제인/국내] 20FW 오프화이트 MARKER 마커 슬림 티셔츠", "253820", "259,000", "2%", "제임스제인")
        
        products.imageCollec = [
            "http://ss070707.cafe24.com/pic/CC970%20(1).jpg",
            "http://ss070707.cafe24.com/pic/CC970%20(2).jpg",
            "http://ss070707.cafe24.com/pic/CC970%20(3).jpg",
            "http://ss070707.cafe24.com/pic/CC970%20(4).jpg"
        ]
        
        products.sizeOptions = [
            "  S사이즈(95)",
            "  M사이즈(100)",
            "  L사이즈(105)",
            "  XL사이즈(110)",
            "  XXL사이즈(115)"
        ]
        
        products.detailImages = [
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/top.png",
            "http://ss070707.cafe24.com/pic/CC970%20(1).jpg",
            "http://ss070707.cafe24.com/pic/CC970%20(2).jpg",
            "http://ss070707.cafe24.com/pic/CC970%20(3).jpg",
            "http://ss070707.cafe24.com/pic/CC970%20(4).jpg",
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/bottom.png"
        ]
        
        return products
        
    }
    
    static func item3() -> ProductThumb{
        
        let products = ProductThumb(image3, "Y-3", "20SS Y-3 로고 블랙 볼캡 모자 FS3318", "82320", "84,000", "2%", "제임스제인")
        
        products.sizeOptions = [
            "  One size"
        ]
        
        products.imageCollec = [
            "http://ss070707.cafe24.com/pic/bb796%20(1).jpg",
            "http://ss070707.cafe24.com/pic/bb796%20(2).jpg"
        ]
        products.detailImages = [
           "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/top.png",
            "http://ss070707.cafe24.com/pic/bb796%20(1).jpg",
            "http://ss070707.cafe24.com/pic/bb796%20(2).jpg",
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/bottom.png"
        ]
        
        return products
        
    }
    
    static func item4() -> ProductThumb{
        
        let products = ProductThumb(image4, "GIVENCHY", "20SS 지방시 코튼 슬리브 로고 반팔 티셔츠", "339080","346,000", "2%", "제임스제인")
        
        products.sizeOptions = [
            "  화이트S사이즈",
            "  블랙S사이즈"
        ]
        
        products.imageCollec = [
            "http://ss070707.cafe24.com/pic/CC791%20(1).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(2).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(3).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(4).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(5).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(6).jpg"
            
        ]
        products.detailImages = [
           "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/top.png",
            "http://ss070707.cafe24.com/pic/CC791%20(1).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(2).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(3).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(4).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(5).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(6).jpg",
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/bottom.png"
        ]
        
        return products
        
    }
    
    static func item5() -> ProductThumb{
        
        let products = ProductThumb(image5, "VALENTINO", "20SS 발렌티노 V 로고 티셔츠 TV3MG02T", "312620","319,000", "2%", "제임스제인")
        
        products.imageCollec = [
            "http://ss070707.cafe24.com/pic/aa785%20(1).jpg",
            "http://ss070707.cafe24.com/pic/aa785%20(2).jpg",
            "http://ss070707.cafe24.com/pic/aa785%20(3).jpg",
            "http://ss070707.cafe24.com/pic/aa785%20(4).jpg"
        ]
        
        products.sizeOptions = [
            "  S사이즈(95)",
            "  M사이즈(100)",
            "  L사이즈(105)",
            "  XL사이즈(110)"
        ]
        products.detailImages = [
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/top.png",
            "http://ss070707.cafe24.com/pic/aa785%20(1).jpg",
            "http://ss070707.cafe24.com/pic/aa785%20(2).jpg",
            "http://ss070707.cafe24.com/pic/aa785%20(3).jpg",
            "http://ss070707.cafe24.com/pic/aa785%20(4).jpg",
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/bottom.png"
        ]
        
        return products
    }
    
    
    static func item6() -> ProductThumb{
        
        let products = ProductThumb(image6, "GUCCI", "20SS 구찌 더블 G 버클 벨트", "524300","535,000", "2%", "제임스제인")
        
        products.imageCollec = [
            "http://ss070707.cafe24.com/pic/BB806%20(1).jpg",
            "http://ss070707.cafe24.com/pic/BB806%20(2).jpg"
        ]
        
        products.sizeOptions = [
            "  95사이즈"
        ]
        products.detailImages = [
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/top.png",
            "http://ss070707.cafe24.com/pic/BB806%20(1).jpg",
            "http://ss070707.cafe24.com/pic/BB806%20(2).jpg",
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/bottom.png"
        ]
        
        return products
    }
    
    static func item7() -> ProductThumb{
        
        let products = ProductThumb(image7, "Stone Island", "[제임스제인/국내]20SS 스톤아일랜드 와펜 네이비 맨투맨", "287000", "299,000", "4%", "제임스제인")
        
        products.imageCollec = [
            "http://ss070707.cafe24.com/pic/BB881%20(1).jpg",
            "http://ss070707.cafe24.com/pic/BB881%20(2).jpg",
            "http://ss070707.cafe24.com/pic/BB881%20(3).jpg",
            "http://ss070707.cafe24.com/pic/BB881%20(4).jpg"
        ]
        
        products.sizeOptions = [
            "  S:Black",
            "  M:Black",
            "  L:Black",
            "  XL:Black",
            "  XXL:Black"
        ]
        products.detailImages = [
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/top.png",
            "http://ss070707.cafe24.com/pic/BB881%20(1).jpg",
            "http://ss070707.cafe24.com/pic/BB881%20(2).jpg",
            "http://ss070707.cafe24.com/pic/BB881%20(3).jpg",
            "http://ss070707.cafe24.com/pic/BB881%20(4).jpg",
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/bottom.png"
        ]
        
        return products
        
    }
    
    static func item8() -> ProductThumb{
        
        let products = ProductThumb(image8, "OFF White", "[제임스제인/국내] 20FW 오프화이트 MARKER 마커 슬림 티셔츠", "253820", "259,000", "2%", "제임스제인")
        products.imageCollec = [
            "http://ss070707.cafe24.com/pic/CC970%20(1).jpg",
            "http://ss070707.cafe24.com/pic/CC970%20(2).jpg",
            "http://ss070707.cafe24.com/pic/CC970%20(3).jpg",
            "http://ss070707.cafe24.com/pic/CC970%20(4).jpg"
        ]
        
        products.sizeOptions = [
            "  S사이즈(95)",
            "  M사이즈(100)",
            "  L사이즈(105)",
            "  XL사이즈(110)",
            "  XXL사이즈(115)"
        ]
        products.detailImages = [
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/top.png",
            "http://ss070707.cafe24.com/pic/CC970%20(1).jpg",
            "http://ss070707.cafe24.com/pic/CC970%20(2).jpg",
            "http://ss070707.cafe24.com/pic/CC970%20(3).jpg",
            "http://ss070707.cafe24.com/pic/CC970%20(4).jpg",
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/bottom.png"
        ]
        
        return products
        
    }
    
    static func item9() -> ProductThumb{
        
        let products = ProductThumb(image9, "Y-3", "20SS Y-3 로고 블랙 볼캡 모자 FS3318", "82320", "84,000", "2%", "제임스제인")
        
        products.imageCollec = [
            "http://ss070707.cafe24.com/pic/bb796%20(1).jpg",
            "http://ss070707.cafe24.com/pic/bb796%20(2).jpg"
        ]
        
        products.sizeOptions = [
            "  One size"
        ]
        products.detailImages = [
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/top.png",
            "http://ss070707.cafe24.com/pic/bb796%20(1).jpg",
            "http://ss070707.cafe24.com/pic/bb796%20(2).jpg",
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/bottom.png"
        ]
        
        return products
        
    }
    
    static func item10() -> ProductThumb{
        
        let products = ProductThumb(image10, "GIVENCHY", "20SS 지방시 코튼 슬리브 로고 반팔 티셔츠", "339080","346,000", "2%", "제임스제인")
        products.imageCollec = [
            "http://ss070707.cafe24.com/pic/CC791%20(1).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(2).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(3).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(4).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(5).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(6).jpg"
        ]
        products.sizeOptions = [
            "  화이트S사이즈",
            "  블랙S사이즈"
        ]
        products.detailImages = [
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/top.png",
            "http://ss070707.cafe24.com/pic/CC791%20(1).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(2).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(3).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(4).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(5).jpg",
            "http://ss070707.cafe24.com/pic/CC791%20(6).jpg",
            "https://d15jp4iwerkqw1.cloudfront.net/images/deals/details/mobile/bottom.png"
        ]
        
        return products
    }  
}

