### **주요기능**
----------------
- 네트워크 환경에서 로그인, 회원가입 및 비밀번호 찾기 구현 (Networking 및 API 표준 모듈화작업)
- 상품 메인화면 구현 (메뉴바 영역 , 메인 배너 영역, 상품 리스트 영역)
- 상세페이지 구현 (상품 사진 영역, 상품 상세 영역, 옵션 리스트 영역)
- 이미지 슬라이드쇼 기반의 이벤트 페이지 구현  

### **완성 화면**
-----------------
![ezgif com-resize (1)](https://user-images.githubusercontent.com/67727048/91655136-91a4d600-eae9-11ea-9cc8-c0f0eb7955cc.gif)     ![ezgif com-resize (2)](https://user-images.githubusercontent.com/67727048/91655139-95d0f380-eae9-11ea-8196-566cc810deea.gif)     ![ezgif com-resize (3)](https://user-images.githubusercontent.com/67727048/91655144-98cbe400-eae9-11ea-814f-8c05e6b1e1a3.gif)

### **완성 화면 레이아웃**
-------------------------
![KakaoTalk_Photo_2020-08-30-17-15-40](https://user-images.githubusercontent.com/67727048/91654524-797e8800-eae4-11ea-9c47-21f01db5dbdf.png)

### **활용한 기술**
-------------------
- Swift,  Moya, AlamoFire, SwiftyJSON, SNS연동 (KakaoTalk, Google Facebook, Apple) 
- Kingfisher, SnapKit
- ProgressHUD, ImageSlideshow, VerticalCardSwiper 등

### **스터디 노트**
-------------------
**Moya를 이용한 API표준 모듈화 작업**
--------------------------------------
<img width="537" alt="스크린샷 2020-08-30 오후 6 07 38" src="https://user-images.githubusercontent.com/67727048/91655473-b5691b80-eaeb-11ea-9853-324f5fad748b.png">
- Http 서버와의 통신을 위해 네트워크 라이브러리 Moya를 사용했고 이를 통해 모듈화 작업 진행

[-"Postman"](https://www.postman.com/downloads/)
_**Postman을 활용 서버연결 테스트 및 체크**_

_**API 연결 방식 스터디**_
 1. 받아올 데이터 : Codable 선언

> 	(1) 선언한 변수의 이름이 실제 데이터와 다른경우, 또는 객체가 한단계 더 들어가는 경우
> 	Enum CodingKeys:String, CodingKey{case} 다시 선언 
> 	(2) Decode해주기
>  	   init(from decoder: Decoder) throws {
> 		//CodingKeys에 들어있는 데이터 decode
> 	        let values = try decoder.container(keyedBy: CodingKeys.self)
> 	        id = try values.decode(Int.self, forKey: .id)
> 	        let location = try values.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)}

 2. networking 함수 만들기

 3. Decode해둔 데이터를 JSON화 변환 함수 만들기

```
	(1) Decode = JSONDecoder()
	(2) 어떤 디코드 데이터를 JSONDecode 시켜줄건지
		do{ loanDataStore = try  decoder.decode(데이터 있는곳.self, from:data
			loans = loanDataStore.loans 
		}catch{print(error)}
```

_**AlamoFire Networking방식**_
 Import AlamoFire

>     1.  Httpurl의  URL / requestURL  형변환
>     2.  AF.request(url).responseData{(result) in 코드 ~~}
> 		//안에 코드는 URLSession.shared.dataTask와 같음
> 
>         (1) If result.error != nil { return } 
>         (2) Else { if let data = result.data 
>             1) getJsonParingData(data:data)
>             2) OperationQueue.main.addOperation{ tableview.reloadData()}

**SnapKit을 활용한 코드 기반 Layout작업**
------------------------------------------------
<img width="421" alt="스크린샷 2020-08-30 오후 6 22 54" src="https://user-images.githubusercontent.com/67727048/91655731-d6327080-eaed-11ea-8a7d-033d58a203d8.png">

> - SnapKit에서는 AutoLayout DSL을 제공해주고 있어, 코드상에서 편하게 Constraint를 조절 가능
> - layout 작업 하기 위해 
`self.contentView.addSubview(wishBTN)// contentView에 addSubView 선언`

**TableViewCell 안에 Horizantal CollectioncViewCell 넣어주기**
---------------------------------------------------------------
 1.  tableViewcell에 collectionViewcell 등록하기

```
collectionView.register(PhotosDetailCollectionViewCell.self, forCellWithReuseIdentifier: photoCollectionCell)
flowLayout.scrollDirection = .horizontal
```

 2. collectionView cell 구성하기(ex) imageView넣기
<img width="449" alt="스크린샷 2020-08-30 오후 6 42 46" src="https://user-images.githubusercontent.com/67727048/91656070-9ae57100-eaf0-11ea-8189-08539bb26935.png">

### **To do List**
------------------


- [x] Back end 연결 보완하기
- [x] RxSwift / RxCocoa 더 공부해보고 적용하기
- [x] MVVM 패턴 업그레이드
 
 
