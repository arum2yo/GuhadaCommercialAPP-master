//
//  EventViewController.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/26.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import VerticalCardSwiper

let eventCell1 = "eventCell1"

class EventViewController: UIViewController, VerticalCardSwiperDatasource, VerticalCardSwiperDelegate, UICollectionViewDelegateFlowLayout {
    
    private var pageSwiper: VerticalCardSwiper!
    var events: EventItems?
    
    var eventpagesImg = ["event1","event2","event3","event4","event5","event6","event7"]
    
    var eventpagesSub = [
        "장마 끝, 미리 만나는 가을옷 초특가",
        "셀렉티드 럭셔리 부티크 이태리 명품",
        "MD가 엄선한 명품지갑 탑20",
        "편하게 멋스럽게 Living Summer",
        "절제된 무드, MIUMIU",
        "나만의 데일리 백",
        "프리미엄 스트릿 웨어 BALENCIAGA"
    ]
    var eventpagesDate = [
        "2020.08.17 ~ 2020.08.31",
        "2020.08.14 ~ 2020.09.13",
        "2020.08.07 ~ 2020.09.06",
        "2020.07.31 ~ 2020.09.19",
        "2020.07.03 ~ 2020.09.19",
        "2020.06.26 ~ 2020.09.19",
        "2020.05.15 ~ 2020.09.19"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageSwiper = VerticalCardSwiper(frame: self.view.bounds)
        
        view.addSubview(pageSwiper)
        
        pageSwiper.datasource = self
        pageSwiper.delegate = self
        
        pageSwiper.register(EventPageCell.self, forCellWithReuseIdentifier: eventCell1)
    }
    
    //MARK:- VerticalSwiper DataSource
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return eventpagesSub.count
    }
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        
        guard let eventCell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: eventCell1, for: index) as? EventPageCell else {
            return CardCell()
        }
        eventCell.eventImg.image = UIImage(named: "\(eventpagesImg[index]).jpg")
        eventCell.eventSubject.text = eventpagesSub[index]
        eventCell.eventDate.text = eventpagesDate[index]
        
        return eventCell
    }
    
    func sizeForItem(verticalCardSwiperView: VerticalCardSwiperView, index: Int) -> CGSize {
        return CGSize(width: 375, height: 400)
    }
}
