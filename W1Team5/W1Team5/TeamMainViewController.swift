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
        setProfileImageRound()
    }
    
    
    //프로필 이미지 둥글기 값
    private var profileImageCornerRadius: CGFloat = 15
    
    @IBOutlet private var profileImageView1: UIImageView!
    @IBOutlet private var profileImageView2: UIImageView!
    @IBOutlet private var profileImageView3: UIImageView!
    @IBOutlet private var profileImageView4: UIImageView!
    @IBOutlet private var profileImageView5: UIImageView!
    @IBOutlet private var profileImageView6: UIImageView!
    
    private var allProfileImageView: [UIImageView] { [profileImageView1,
                                                      profileImageView2,
                                                      profileImageView3,
                                                      profileImageView4,
                                                      profileImageView5,
                                                      profileImageView6]
    }
    
}


extension TeamMainViewController {
    
    private func setProfileImageRound() {
        allProfileImageView.forEach { imageView in
            
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = profileImageCornerRadius
            
            imageView.layer.maskedCorners = CACornerMask(arrayLiteral:.layerMaxXMaxYCorner,
                                                         .layerMinXMinYCorner,
                                                         .layerMinXMaxYCorner,
                                                         .layerMaxXMinYCorner)
        }
    }
    
}
