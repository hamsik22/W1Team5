//
//  HamsikViewController.swift
//  W1Team5
//
//  Created by 황석현 on 10/21/24.
//

import UIKit

class HamsikViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var hamsikImage: UIImageView!
    @IBOutlet weak var hamsikName: UILabel!
    @IBOutlet weak var hamsikMBTI: UILabel!
    
    @IBOutlet weak var strengthsTableView: UITableView!
    @IBOutlet weak var styleTableView: UITableView!
    @IBOutlet weak var cooperationTableView: UITableView!

    let hamsikInfo: HamsikInfo = HamsikInfo(name: "황석현",
                                            description: "혼자서 만들기보다는 다같이 만드는 것을 좋아하는 개발자 지망생입니다!",
                                            mbti: "ENFJ",
                                            strengths: ["긍정적이에요!", "대화하는 것을 좋아합니다!", "체력이 좋아요!"],
                                            style: ["계획적입니다!", "깔끔한 것을 좋아해요!"],
                                            cooperation: ["리뷰를 좋아해요!", "실험적인 것을 좋아해요!", "소통 자체를 좋아합니다!"],
                                            blogURL: "https://somehdd.tistory.com/",
                                            profileImage: "HSHPF",
                                            zepImage: "HSHZep")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        hamsikName.text = hamsikInfo.name
        hamsikMBTI.text = hamsikInfo.mbti
        strengthsTableView.delegate = self
        strengthsTableView.dataSource = self
        styleTableView.delegate = self
        styleTableView.dataSource = self
        cooperationTableView.delegate = self
        cooperationTableView.dataSource = self
        
        strengthsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        styleTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        cooperationTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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

}

struct HamsikInfo {
    let name: String
    let description: String
    let mbti: String
    let strengths: [String]
    let style: [String]
    let cooperation: [String]
    let blogURL: String
    let profileImage: String
    let zepImage: String
}
