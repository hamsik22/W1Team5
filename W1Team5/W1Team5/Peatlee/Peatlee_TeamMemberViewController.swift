//
//  ViewController.swift
//  TeamMainView
//
//  Created by t2023-m0072 on 10/21/24.
//

import UIKit
import SafariServices

final class PeatleeTeamMemberViewController: UIViewController {
    
    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var mbtiLabel: UILabel!
    @IBOutlet private var blogButton: UIButton?
    @IBOutlet private var gitHubButton: UIButton?
    
    @IBOutlet private var profileStackView: UIStackView!
    @IBOutlet private var introduceStackView: UIStackView!
    
    
    private var teamMemberInfo: TeamMemberInfo?
    private var iconCornerRadius: CGFloat = 10
    private var profileImageCornerRadius: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
    }
    
}




//MARK: - Set Up View
extension PeatleeTeamMemberViewController {
    
    private func setUpView() {
        self.view.backgroundColor = .white
        
        self.setTeamMemberInfo()
        
        self.setProfileImageView()
        self.setProfileGestureRecognizer()
        
        self.setViewCornerRound()
        self.setNameLabel()
        self.setMBTILabel()
        
        self.setBlogButton()
        self.setGithubButton()
        
        self.updateIntroduce()
    }
    
    
    
    private func setTeamMemberInfo() {
        self.teamMemberInfo = .ljy
    }
    
    private func setViewCornerRound() {
        
        self.profileStackView.clipsToBounds = true
        self.profileStackView.layer.cornerRadius = 40
        self.profileStackView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner, .layerMinXMinYCorner)
        
        self.introduceStackView.clipsToBounds = true
        self.introduceStackView.layer.cornerRadius = 40
        self.introduceStackView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        
    }
}


//MARK: - Profile
extension PeatleeTeamMemberViewController {
    
    private func setProfileImageView() {
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageCornerRadius
        self.profileImageView.contentMode = .scaleAspectFill
        self.profileImageView.backgroundColor = .white
        
        self.setProfileImage()
    }
    
    
    private func setProfileImage() {
        guard let teamMemberInfo = self.teamMemberInfo else { return }
        let zepImage = UIImage(named: teamMemberInfo.zepImageAssetName)
        self.profileImageView.image = zepImage
    }
    
}


//MARK: - Gesture Recognizer(for ProfileImage)
extension PeatleeTeamMemberViewController {
    
    private func setProfileGestureRecognizer() {
        profileImageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.profileImageLongPressed(_:)))
        gestureRecognizer.minimumPressDuration = 0
        
        self.profileImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc private func profileImageLongPressed(_ sender: UITapGestureRecognizer) {
        guard let teamMemberInfo = self.teamMemberInfo else { return }
        let zepImage = UIImage(named: teamMemberInfo.zepImageAssetName)
        let profileImage = UIImage(named: teamMemberInfo.profileImageAssetName)
        
        switch sender.state {
        case .began, .changed:
            self.profileImageView.image = profileImage
        case .ended, .cancelled, .failed:
            self.profileImageView.image = zepImage
        default:
            break
        }
    }
}


//MARK: - Label
extension PeatleeTeamMemberViewController {
    
    private func setNameLabel() {
        guard let teamMemberInfo = self.teamMemberInfo else { return }
        nameLabel.text = teamMemberInfo.name
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        nameLabel.backgroundColor = .clear
    }
    
    private func setMBTILabel() {
        guard let teamMemberInfo = self.teamMemberInfo else { return }
        mbtiLabel.text = " " + teamMemberInfo.mbti + " "
        mbtiLabel.textColor = .white
        mbtiLabel.backgroundColor = .systemOrange
        mbtiLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        mbtiLabel.clipsToBounds = true
        mbtiLabel.layer.cornerRadius = 7
//        mbtiLabel.layer
        
    }
    
}


//MARK: - Blog Button
extension PeatleeTeamMemberViewController {
    
    
    private func setBlogButton() {
        blogButton?.backgroundColor = .clear
        blogButton?.setTitle(nil, for: .normal)
        
        guard let teamMemberInfo = self.teamMemberInfo else { return }
        guard let blogButton = self.blogButton else { return }
        guard let blogImage = UIImage(named: "\(teamMemberInfo.blog.rawValue)_ic") else { return }
        
        blogButton.contentMode = .scaleAspectFit
        blogButton.setImage(blogImage, for: .normal)
        
        blogButton.imageView?.clipsToBounds = true
        blogButton.imageView?.layer.cornerRadius = iconCornerRadius
        
        blogButton.addTarget(self, action: #selector(touchUpBlogButton), for: .touchUpInside)
    }
    
    @objc private func touchUpBlogButton(_ sender: UIButton) {
        guard let blogURL = self.teamMemberInfo?.blogURL else { return }
        
        let blogSafariView = SFSafariViewController(url: blogURL)
        self.present(blogSafariView, animated: true, completion: nil)
    }
}


//MARK: - Github Button
extension PeatleeTeamMemberViewController {
    
    private func setGithubButton() {
        
        gitHubButton?.backgroundColor = .clear
        gitHubButton?.setTitle(nil, for: .normal)
        
        guard let _ = self.teamMemberInfo else { return }
        guard let gitHubButton = self.gitHubButton else { return }
        guard let gitHubImage = UIImage(named: "GitHub_ic") else { return }
        
        gitHubButton.contentMode = .scaleAspectFit
        gitHubButton.setImage(gitHubImage, for: .normal)
        
        gitHubButton.imageView?.clipsToBounds = true
        gitHubButton.imageView?.layer.cornerRadius = iconCornerRadius
        
        
        
        gitHubButton.addTarget(self, action: #selector(touchUpGitHubButton), for: .touchUpInside)
    }
    
    @objc private func touchUpGitHubButton(_ sender: UIButton) {
        guard let gitHubURL = self.teamMemberInfo?.gitHubURL else { return }
        
        let gitHubSafariView = SFSafariViewController(url: gitHubURL)
        self.present(gitHubSafariView, animated: true, completion: nil)
    }
    
}

//MARK: - updateIntroduce
extension PeatleeTeamMemberViewController {
    
    private func updateIntroduce() {
        guard let teamMemberInfo = self.teamMemberInfo else { return }
        
        if let introducationStackView = self.introduceStackView.arrangedSubviews[0] as? UIStackView {
            if let introducationTextView = introducationStackView.arrangedSubviews[1] as? UITextView {
                
                introducationTextView.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
                introducationTextView.text = "  " + teamMemberInfo.introduction
                introducationTextView.isSelectable = false
            }
        }
        
        if let meritStackView = self.introduceStackView.arrangedSubviews[1] as? UIStackView {
            if let meritTextView = meritStackView.arrangedSubviews[1] as? UITextView {
                
                meritTextView.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
                meritTextView.text = teamMemberInfo.merit.map { "  " + $0 }.joined(separator: "\n")
                meritTextView.isSelectable = false
                
            }
        }
        
        if let styleStackView = self.introduceStackView.arrangedSubviews[2] as? UIStackView {
            if let styleTextView = styleStackView.arrangedSubviews[1] as? UITextView {
                
                styleTextView.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
                styleTextView.text = teamMemberInfo.style.map { "  " + $0 }.joined(separator: "\n")
                styleTextView.isSelectable = false
                
            }
        }
        
        if let cooperationStyleStackView = self.introduceStackView.arrangedSubviews[3] as? UIStackView {
            if let cooperationStyleTextView = cooperationStyleStackView.arrangedSubviews[1] as? UITextView {
                
                cooperationStyleTextView.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
                cooperationStyleTextView.text = teamMemberInfo.cooperationStyle.map { "  " + $0 }.joined(separator: "\n")
                cooperationStyleTextView.isSelectable = false
            }
        }
    }
}








//MARK: - TeamMemberInfo
private struct TeamMemberInfo {
    
    static let ljy = TeamMemberInfo(assetIdentifier: "Peatlee",
                                    name: "이재영", mbti: "INTP",
                                    introducation: "뭐든 이해하는 걸 즐깁니다.",
                                    merit: ["차분합니다"],
                                    style: ["천천히 알아가는 성격입니다.",
                                            "집중하면 다른 소리가 잘 듣지 못합니다."],
                                    cooperationStyle: ["아직 잘 모르겠습니다.",
                                                       "현재는 수용적인 태도를 유지하려 합니다."],
                                    blog: .velog, blogURL: "https://velog.io/@ldc1000/posts",
                                    githubURL: "https://github.com/peatle-e")
    
    private let assetIdentifier: String
    let name: String
    let mbti: String
    let introduction: String
    let merit: [String]
    let style: [String]
    let cooperationStyle: [String]
    
    let blog: Blog
    let blogURL: URL
    let gitHubURL: URL
    
    var profileImageAssetName: String { self.assetIdentifier + "_PF" }
    var zepImageAssetName: String { self.assetIdentifier + "_ZEPPF" }
    
    init?(assetIdentifier: String, name: String, mbti: String, introducation: String, merit: [String], style: [String], cooperationStyle: [String], blog: Blog, blogURL: String, githubURL: String) {
        
        guard let blogURL = URL(string:blogURL) else {
            print("\(name): Vlog URL 생성 실패")
            return nil
        }
        guard let githubURL = URL(string:githubURL) else {
            print("\(name): GitHub URL 생성 실패")
            return nil
        }
        
        self.assetIdentifier = assetIdentifier
        self.name = name
        self.mbti = mbti.uppercased()
        self.introduction = introducation
        self.merit = merit
        
        self.style = style
        self.cooperationStyle = cooperationStyle
        self.blog = blog
        self.blogURL = blogURL
        self.gitHubURL = githubURL
    }
    
    enum Blog: String {
        case velog = "Velog"
        case tistory = "Tistory"
    }
}




