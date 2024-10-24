//
//  MunDetailViewController.swift
//  W1Team5
//
//  Created by mun on 10/24/24.
//

import UIKit

class MunDetailViewController: UIViewController {
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userNameSmall: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postContent: UILabel!
    @IBOutlet weak var postUploadDate: UILabel!
    @IBOutlet weak var dotImage: UIImageView!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var commentImage: UIImageView!
    @IBOutlet weak var archiveImage: UIImageView!
    
    var iconData: IconData = IconData(iconDot: "iconDot", iconHeart: "iconHeart", iconComment: "iconComment", iconArchive: "iconArchive")

    // collectionView에서 넘어온 값
    var prepareUserName: String!
    var prepareUserProfileImage: String!
    var preparePostImage: String!
    var preparePostContent: String!
    var preparePostUploadDate: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.text = prepareUserName
        userNameSmall.text = prepareUserName
        userProfileImage.image = UIImage(named: prepareUserProfileImage)
        userProfileImage.layer.cornerRadius = userProfileImage.frame.height / 2
        postImage.image = UIImage(named: preparePostImage)
        postContent.text = preparePostContent
        postUploadDate.text = preparePostUploadDate
        
        dotImage.image = UIImage(named: iconData.iconDot)
        heartImage.image = UIImage(named: iconData.iconHeart)
        commentImage.image = UIImage(named: iconData.iconComment)
        archiveImage.image = UIImage(named: iconData.iconArchive)
        
        setupGestureRecognizerHeart()
        setupGestureRecognizerArchive()
        

    }

}

// 좋아요, 저장 토글 구현
extension MunDetailViewController {
    
    // 좋아요 이미지 클릭 제스처 인식
    private func setupGestureRecognizerHeart() {
        let tapGestureRecognizerHeart = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureHeart))
        heartImage.addGestureRecognizer(tapGestureRecognizerHeart)
        heartImage.isUserInteractionEnabled = true
    }
    
    // 저장 이미지 클릭 제스처 인식
    private func setupGestureRecognizerArchive() {
        let tapGestureRecognizerArchive = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureArchive))
        archiveImage.addGestureRecognizer(tapGestureRecognizerArchive)
        archiveImage.isUserInteractionEnabled = true
    }
    
    // 좋아요 이미지 클릭시 작동
    @objc func handleTapGestureHeart(_ tapGestureRecognizerHeart: UITapGestureRecognizer) {
        if iconData.iconHeart == "iconHeart" {
            heartImage.image = UIImage(named: "iconHeartFill")
            iconData.iconHeart = "iconHeartFill"
        } else {
            heartImage.image = UIImage(named: "iconHeart")
            iconData.iconHeart = "iconHeart"
        }
    }
    //저장 이미지 클릭시 작동
    @objc func handleTapGestureArchive(_ tapGestureRecognizerSend: UITapGestureRecognizer) {
        if iconData.iconArchive == "iconArchive" {
            archiveImage.image = UIImage(named: "iconArchiveFill")
            iconData.iconArchive = "archiveFill"
        } else {
            archiveImage.image = UIImage(named: "iconArchive")
            iconData.iconArchive = "iconArchive"

        }
    }
}
