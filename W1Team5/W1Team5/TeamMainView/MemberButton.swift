//
//  MemberButton.swift
//  W1Team5
//
//  Created by t2023-m0072 on 10/23/24.
//

import UIKit

class MemberButton: UIButton {
    
    static private let defaultImage: UIImage = UIImage(named: "Peatlee_ZEP") ?? UIImage()
    
    private var name: String = "이름 없음"
    
    private var zepImageAssetName: String? {
        guard let identifier = self.identifier else { return nil }
        return identifier + "_ZEP"
    }
    
    private var identifier: String? = nil

    
}



//MARK: - setUpUI
extension MemberButton {
    
    func setProfile(_ memberProfile: MemberProfile) {
        self.name = memberProfile.name
        self.identifier = memberProfile.identifier
        setUpUI()
    }
    
    
    private func setUpUI() {
        setButton()
        setTitleLabel()
        setImageView()
    }
    
    
    private func setButton() {
        self.contentMode = .scaleAspectFit
        self.backgroundColor = .white
        self.tintColor = .clear
    }
    
    private func setTitleLabel() {
        
        self.setTitle(self.name, for: .normal)
        self.setTitleColor(.black, for: .normal)
//        self.font

        self.setTitle("프로필 ▷", for: .highlighted)
        self.setTitleColor(.systemBlue, for: .highlighted)
        
        guard let titleLabel = self.titleLabel else { return }
        
        
        titleLabel.font = UIFont.monospacedSystemFont(ofSize: 17, weight: .heavy)
        titleLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let bottomAnchor = titleLabel.bottomAnchor.constraint(equalTo: self.topAnchor)
        let centerXAnchor = titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        bottomAnchor.isActive = true
        centerXAnchor.isActive = true
        titleLabel.contentMode = .scaleAspectFit
        
    }
    
    private func setImageView() {
        
        self.setImage(nil, for: .normal)

        var image: UIImage = Self.defaultImage
        
        if let zepImageAssetName = zepImageAssetName {
            if let zepImage = UIImage(named: zepImageAssetName) {
                image = zepImage
            }
        }
        
        image.withTintColor(.clear)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        
        self.addSubview(imageView)
        
        imageView.tintColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = imageView.topAnchor.constraint(equalTo: self.topAnchor)
        let bottomConstraint = imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let leadingConstraint = imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailingConstraint = imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
    }
}
