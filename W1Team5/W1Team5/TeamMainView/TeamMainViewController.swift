//
//  ViewController.swift
//  TeamMainView
//
//  Created by t2023-m0072 on 10/21/24.
//

import UIKit


class TeamMainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureTeamTableView()
        setUpTableView()
        setUpProfileButtons()
    }
    
    @IBOutlet private var teamInfoTableView: UITableView!
    private let teamInfoDataSource = TeamInfoTableViewDataSource()
    
    //프로필 이미지 둥글기 값
    private var teamInformationCornerRadius: CGFloat = 15
    
    @IBOutlet private var profileButton1: MemberButton!
    @IBOutlet private var profileButton2: MemberButton!
    @IBOutlet private var profileButton3: MemberButton!
    @IBOutlet private var profileButton4: MemberButton!
    @IBOutlet private var profileButton5: MemberButton!
    @IBOutlet private var profileButton6: MemberButton!
    
    private var profileButtons: [MemberButton] { [profileButton1,
                                              profileButton2,
                                              profileButton3,
                                              profileButton4,
                                              profileButton5,
                                              profileButton6] }
    
    private var memberProfile: [MemberProfile] = [hamsik, jay, mun, ryu, peatlee, ahn]
}


//MARK: - TableView
extension TeamMainViewController {
    
    private func configureTeamTableView() {
        self.teamInfoTableView.register(TeamInfoTableViewCell.self,
                                        forCellReuseIdentifier: "TeamInfoTableViewCell")
        
        self.teamInfoTableView.dataSource = teamInfoDataSource
    }
    
    private func setUpTableView() {
        self.teamInfoTableView.backgroundColor = .clear
        
        self.teamInfoTableView.separatorStyle = .none
        
        // 테이블 뷰 둥글기 조절
        self.teamInfoTableView.clipsToBounds = true
        self.teamInfoTableView.layer.cornerRadius = 20
        
        //위 아래 공백 제거
        self.teamInfoTableView.contentInset = .init(top: 0, left: 0, bottom: -15, right: 0)
        self.teamInfoTableView.scrollIndicatorInsets = .zero
        self.teamInfoTableView.tableHeaderView = UIView(frame: .zero)
        self.teamInfoTableView.tableFooterView = UIView(frame: .zero)
        self.teamInfoTableView.sectionHeaderHeight = .zero
        self.teamInfoTableView.sectionFooterHeight = .zero
        
        //스크롤 바 끔
        self.teamInfoTableView.showsVerticalScrollIndicator = false
    }
}


//MARK: - Member Button
extension TeamMainViewController {
    
    private func setUpProfileButtons() {
        
        for number in 0..<profileButtons.count {
            let profile = self.memberProfile[number]
            self.profileButtons[number].setProfile(profile)
        }
    }
}
