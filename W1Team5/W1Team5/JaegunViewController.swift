//
//  JaegunViewController.swift
//  W1Team5
//
//  Created by 이재건 on 10/23/24.
//

import Foundation
import UIKit
import SafariServices

class JaegunViewController: UIViewController {
    
    //이미지뷰
    @IBOutlet weak var LJGPF: UIImageView!
    @IBOutlet weak var LJGZep: UIImageView!
    @IBOutlet weak var hbPic: UIImageView!
    
    //텍스트뷰
    @IBOutlet weak var introduceZone: UITextView!
    
    //레이블
    @IBOutlet weak var nameLabel: UILabel!
    
    let PF = UIImage(named: "LJGPF")
    let Zep = UIImage(named: "LJGZep")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LJGPF.image = UIImage(named: "LJGPF")
        LJGPF.layer.cornerRadius = 15
        
        LJGZep.image = UIImage(named: "LJGZep")
        LJGZep.layer.cornerRadius = 15
        
        hbPic.image = UIImage(named: "hbPic")
        hbPic.layer.cornerRadius = 15
        
        introduceZone.layer.cornerRadius = 15
        
    }
    
    
    
    @IBAction func btnBlog(_ sender: UIButton) {
        guard let blogUrl = URL(string: "https://quaker.tistory.com/") else {
            return
        }
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: blogUrl)
        self.present(blogSafariView, animated: true, completion: nil)
    }
    
    @IBAction func btnGitHub(_ sender: UIButton) {
        guard let gitHubUrl = URL(string: "https://github.com/Quaker-Lee") else {
            return
        }
        let gitHubSafariView: SFSafariViewController = SFSafariViewController(url: gitHubUrl)
        self.present(gitHubSafariView, animated: true, completion: nil)
    }
    
    @IBAction func btnCar(_ sender: UIButton) {
        guard let carUrl = URL(string: "https://namu.wiki/w/BMW%205%EC%8B%9C%EB%A6%AC%EC%A6%88/4%EC%84%B8%EB%8C%80") else {
            return
        }
        let carSafariView: SFSafariViewController = SFSafariViewController(url: carUrl)
        self.present(carSafariView, animated: true, completion: nil)
    }
    
    @IBAction func btnParrot(_ sender: Any) {
        guard let parrotUrl = URL(string: "https://namu.wiki/w/%ED%80%98%EC%9D%B4%EC%BB%A4(%EC%A1%B0%EB%A5%98)") else {
            return
        }
        let parrotSafariView: SFSafariViewController = SFSafariViewController(url: parrotUrl)
        self.present(parrotSafariView, animated: true, completion: nil)
    }
    
    @IBAction func btnMbti(_ sender: Any) {
        guard let mbtiUrl = URL(string: "https://namu.wiki/w/ENTJ") else {
            return
        }
        let mbtiSafariView: SFSafariViewController = SFSafariViewController(url: mbtiUrl)
        self.present(mbtiSafariView, animated: true, completion: nil)
    }
    
    
}
