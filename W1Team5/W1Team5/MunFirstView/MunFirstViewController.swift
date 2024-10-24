//
//  MunFirstViewController.swift
//  W1Team5
//
//  Created by mun on 10/24/24.
//

import UIKit
import SafariServices
class MunFirstViewController: UIViewController {
    
    @IBOutlet weak var munProfileImage: UIImageView!
    @IBOutlet weak var munName: UILabel!
    @IBOutlet weak var munIntroduce: UILabel!
    @IBOutlet weak var munPhotoCollectionView: UICollectionView!
    
    let munData: MunData = MunData(name:"name.mun",
                                   introduce: "가치있는 앱을 만드는 개발자가 되겠습니다!",
                                   mbti: "ESFP",
                                   strengths:["a"],
                                   style:["a"],
                                   cooperation:["a"],
                                   blogURL: "https://name-mun.tistory.com",
                                   githubURL: "https://github.com/name-mun",
                                   profileImage: "SMGEPF",
                                   photo: ["collectionPhoto1", "collectionPhoto2","collectionPhoto3","collectionPhoto4","collectionPhoto5","collectionPhoto6","collectionPhoto7","collectionPhoto8","collectionPhoto9","collectionPhoto10"],
                                   content: ["파리 방브마켓에서 찍은 사진입니다!", "몽마르뜨 언덕은 예술가로 넘쳐나요", "파리에서 많은 사진을 찍었어요", "저는 스냅사진도 찍었어요","굿!","6","7","8","9","10"],
                                   time: ["OCTOBER 23","OCTOBER 22","OCTOBER 21","OCTOBER 20","OCTOBER 20","OCTOBER 19","OCTOBER 18","OCTOBER 17","OCTOBER 17","OCTOBER 17"])
    
    let layout = UICollectionViewFlowLayout()
    let itemWidth: CGFloat = UIScreen.main.bounds.width/3.0

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        munPhotoCollectionView.delegate = self
        munPhotoCollectionView.dataSource = self
        
        munProfileImage.image = UIImage(named: munData.profileImage)
        munProfileImage.layer.cornerRadius = munProfileImage.frame.height/2
        munName.text = munData.name
        munIntroduce.text = munData.introduce
        
        // colelctionView 레이아웃 설정
        layout.itemSize = CGSize(width: itemWidth-2, height: itemWidth-2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 2
        munPhotoCollectionView.collectionViewLayout = layout
    }
    
    
    // 블로그 버튼 클릭시 링크 이동
    
    @IBAction func clickBlogButton(_ sender: Any) {
        guard let blogURL = URL(string: munData.blogURL) else { return }
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: blogURL)
        self.present(blogSafariView, animated: true, completion: nil)
    }
    
    // 블로그 버튼 클릭시 링크 이동
    @IBAction func clickGithubButton(_ sender: Any) {
        guard let githubURL = URL(string: munData.githubURL) else { return }
        let githubSafariView: SFSafariViewController = SFSafariViewController(url: githubURL)
        self.present(githubSafariView, animated: true, completion: nil)
    }

}

extension MunFirstViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // collectionView 아이템 갯수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        // photo 배열 길이로 설정
        let number = munData.photo.count
        return number
    }
    
    // collectionView cell 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = munPhotoCollectionView.dequeueReusableCell(withReuseIdentifier: "munCell", for: indexPath) as! MunPhotoCollectionViewCell
        
        // 각 셀에 photo 배열의 요소를 하나씩 넣음
        cell.collectionImageView.image = UIImage(named: munData.photo[indexPath.row])
        return cell
    }
    
    
}
