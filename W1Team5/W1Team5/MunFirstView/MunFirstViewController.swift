//
//  MunFirstViewController.swift
//  W1Team5
//
//  Created by mun on 10/23/24.
//

import UIKit
import SafariServices

class MunFirstViewController: UIViewController {
    
    @IBOutlet weak var munProfileImage: UIImageView!
    @IBOutlet weak var munName: UILabel!
    @IBOutlet weak var munIntroduce: UILabel!
    
    let munData: MunData = MunData(name:"name.mun",
                                   introduce: "가치있는 앱을 만드는 개발자가 되겠습니다!",
                                   mbti: "ESFP",
                                   strengths:["a"],
                                   style:["a"],
                                   cooperation:["a"],
                                   blogURL: "https://name-mun.tistory.com",
                                   githubURL: "https://github.com/name-mun",
                                   profileImage: "munProfileImage",
                                   photo: ["collectionPhoto1.jpg", "collectionPhoto2.jpg","collectionPhoto3.jpg","collectionPhoto4.jpg","collectionPhoto5.jpg","collectionPhoto6.jpg","collectionPhoto7.jpg","collectionPhoto8.jpg","collectionPhoto9.jpg","collectionPhoto10.jpg"],
                                   content: ["파리 방브마켓에서 찍은 사진입니다!", "몽마르뜨 언덕은 예술가로 넘쳐나요", "파리에서 많은 사진을 찍었어요", "저는 스냅사진도 찍었어요","굿!","6","7","8","9","10"],
                                   time: ["OCTOBER 23","OCTOBER 22","OCTOBER 21","OCTOBER 20","OCTOBER 20","OCTOBER 19","OCTOBER 18","OCTOBER 17","OCTOBER 17","OCTOBER 17"])
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        munProfileImage.image = UIImage(named: munData.profileImage)
        munProfileImage.layer.cornerRadius = munProfileImage.frame.height/2
        munName.text = munData.name
        munIntroduce.text = munData.introduce
    }
    
    // 블로그 버튼 클릭시 링크 이동
    @IBAction func clickBlogButton(_ sender: Any) {
        let blogURL = NSURL(string:"https://name-mun.tistory.com")
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: blogURL as! URL)
        self.present(blogSafariView, animated: true, completion: nil)
    }
    
    // 블로그 버튼 클릭시 링크 이동
    @IBAction func clickGithubButton(_ sender: Any) {
        let githubURL = NSURL(string:"https://github.com/name-mun")
        let githubSafariView: SFSafariViewController = SFSafariViewController(url: githubURL as! URL)
        self.present(githubSafariView, animated: true, completion: nil)
    }
}
