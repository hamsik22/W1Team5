//
//  ViewController.swift
//  W1Team5
//
//  Created by 유태호 on 10/22/24.
//

import UIKit
import SafariServices

class taeryu97ViewController: UIViewController {
    
    var Name = "유태호"
    var MBTI = "ENFP"
    var Intro = ["요리사출신, ", "기획자 겸 개발자, ", "감성충 앱등이, ", "메창"]
    var Merit = ["추진력, ", "행동력, ", "다재다능, ", "열정적"]
    var Style = ["인간관계, ", "사회적, ", "감성적"]
    var WorkStyle = ["소통, ", "커뮤니케이션, ", "검색"]
    var Blog = "https://velog.io/@taeryu7/posts"
    
    
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var LabelName: UILabel!
    
    @IBOutlet weak var LabelMBTI: UILabel!
    
    @IBOutlet weak var LabelIntro: UILabel!
    
    @IBOutlet weak var LabelMerit: UILabel!
    
    @IBOutlet weak var LabelStyle: UILabel!
    
    @IBOutlet weak var LabelWorkStyle: UILabel!
    
    @IBOutlet weak var textView: UITextView!  {
        didSet {
            textView.text = "블로그 : https://velog.io/@taeryu7/posts"
            textView.isEditable = false
            textView.dataDetectorTypes = .link
        }
    }
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        LabelName.text = "이름 : " + Name
        
        LabelMBTI.text = "MBTI : " + MBTI
        
        LabelIntro.text = "자기소개 : " + Intro.joined()
        
        LabelMerit.text = "내 장점 : " + Merit.joined()
        
        LabelStyle.text = "스타일 : " + Style.joined()
        
        LabelWorkStyle.text = "작업 스타일 : " + WorkStyle.joined()

    }
    

    /*
    func LabelBlogTapped(gestureRecognizer: UITapGestureRecognizer) {
        let BlogLabel = URL(string: Blog)!
        let safariVC = SFSafariViewController(url: BlogLabel)
        self.present(safariVC, animated: true, completion: nil)
    }
    */
    func imageViewTapped(gestureRecognizer: UITapGestureRecognizer) {
        
    }

}

/*
 현재 막히는것
 1. 배열로 라벨안에 데이터를 넣었을때에 라벨내의 데이터 띄워쓰기
 ㄴ 안된다면 그냥 String 데이터로 변환후 떄려넣을 예정
 
 2. 하단 label 칸마다 밑줄 넣기
 ㄴ 안된다면 패스
 
 3. 스크롤뷰 적용 (최우선)
 ㄴ 일단 찾아봤는데 마땅히 정보가 안나오는상황, 안되면 튜터님 찾아갈예정
 
 4. 이미지뷰에 이미지 넣기
 만약 가능하다면 이미지뷰 터치시 이미지 커졌다 줄어들게
 
 5. 블로그링크 띄우기
 */
