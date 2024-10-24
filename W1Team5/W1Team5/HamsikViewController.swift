//
//  HamsikViewController.swift
//  W1Team5
//
//  Created by 황석현 on 10/21/24.
//

import UIKit
import SafariServices

class HamsikViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //동적 뷰
    @IBOutlet weak var hamsikDescription: UILabel!
    @IBOutlet weak var hamsikImage: UIImageView!
    @IBOutlet weak var hamsikName: UILabel!
    @IBOutlet weak var hamsikMBTI: UILabel!
    @IBOutlet weak var strengthsTableView: UITableView!
    @IBOutlet weak var styleTableView: UITableView!
    @IBOutlet weak var cooperationTableView: UITableView!
    @IBOutlet weak var goBlogButton: UIButton!
    
    
    // MARK: 데이터 초기화
    let hamsikInfo: HamsikInfo = HamsikInfo(name: "황석현",
                                            description: "혼자서 만들기보다는 다같이 만드는 것을 좋아하는 개발자 지망생입니다!",
                                            mbti: "ENFJ",
                                            strengths: ["긍정적이에요!", "대화하는 것을 좋아합니다!", "체력이 좋아요!"],
                                            style: ["계획적입니다!", "깔끔한 것을 좋아해요!", "신속한 것을 좋아해요!"],
                                            cooperation: ["리뷰를 좋아해요!", "실험적인 것을 좋아해요!", "소통 자체를 좋아합니다!"],
                                            blogURL: "https://somehdd.tistory.com/",
                                            profileImage: "HSHPF",
                                            zepImage: "HSHZep")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        hamsikImage.image = UIImage(named: hamsikInfo.profileImage)
        hamsikName.text = hamsikInfo.name
        hamsikMBTI.text = hamsikInfo.mbti
        hamsikDescription.text = hamsikInfo.description
        
        // 각 테이블뷰의 델리게이트와 데이터소스 초기화
        strengthsTableView.delegate = self
        strengthsTableView.dataSource = self
        styleTableView.delegate = self
        styleTableView.dataSource = self
        cooperationTableView.delegate = self
        cooperationTableView.dataSource = self
        
        // Cell 식별자 등록
        strengthsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        styleTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        cooperationTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 입력받은 뷰 이름의 데이터 갯수만큼 cell 생성
        switch tableView {
        case strengthsTableView:
            return hamsikInfo.strengths.count
        case styleTableView:
            return hamsikInfo.style.count
        case cooperationTableView:
            return hamsikInfo.cooperation.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // 입력받은 뷰 이름의 데이터를 indexPath 순서대로 표시
        switch tableView {
        case strengthsTableView:
            cell.textLabel?.text = hamsikInfo.strengths[indexPath.row]
        case styleTableView:
            cell.textLabel?.text = hamsikInfo.style[indexPath.row]
        case cooperationTableView:
            cell.textLabel?.text = hamsikInfo.cooperation[indexPath.row]
        default:
            break
        }
        return cell
    }
    
    /// safafri 웹을 표시하는 함수
    @IBAction func goBlogButtonTapped(_ sender: Any) {
        guard let blogUrl = URL(string: hamsikInfo.blogURL) else { return  }
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: blogUrl)
        self.present(blogSafariView, animated: true, completion: nil)
    }
}


