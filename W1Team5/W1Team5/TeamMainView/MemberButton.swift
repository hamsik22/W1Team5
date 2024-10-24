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
        guard let titleLabel = self.titleLabel else {
            print("MemberButton: TitleLabel set fail")
            return
        }
        
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .clear
        titleLabel.font = UIFont.monospacedSystemFont(ofSize: 17, weight: .ultraLight)
        titleLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let bottomAnchor = titleLabel.bottomAnchor.constraint(equalTo: self.topAnchor)
        bottomAnchor.isActive = true
        titleLabel.contentMode = .scaleAspectFit
        
        
        let outLineLabel = UILabel()
        self.addSubview(outLineLabel)

        outLineLabel.text = self.name
        outLineLabel.textColor = .black
        outLineLabel.backgroundColor = .clear
        outLineLabel.font = UIFont.monospacedSystemFont(ofSize: 17, weight: .black)
        
        outLineLabel.textAlignment = .center
        
        outLineLabel.translatesAutoresizingMaskIntoConstraints = false
        let centerXConstraint = outLineLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor)
        let centerYConstraint = outLineLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)

        NSLayoutConstraint.activate([centerXConstraint,centerYConstraint])
        
    }
    
    private func setImageView() {
        
        self.setImage(nil, for: .normal)

        var image: UIImage = Self.defaultImage
        
        if let zepImageAssetName = zepImageAssetName {
            if let zepImage = UIImage(named: zepImageAssetName) {
                image = zepImage
            }
        }
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        
        self.addSubview(imageView)
        
        imageView.tintColor = .clear
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = imageView.topAnchor.constraint(equalTo: self.topAnchor)
        let bottomConstraint = imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let leadingConstraint = imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailingConstraint = imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
    }
}
