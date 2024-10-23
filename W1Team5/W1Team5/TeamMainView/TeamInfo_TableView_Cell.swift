//
//  TeamInfo_TableView_Cell.swift
//  W1Team5
//
//  Created by t2023-m0072 on 10/23/24.
//

import UIKit

class TeamInfoTableViewCell: UITableViewCell {
    
    private var title: String = "값 없음"
    private var contents: [String] = ["값 없음"]
    
    private let stackViewCornerRadius: CGFloat = 20
    private let titleLabelCornerRadius: CGFloat = 7
    private let cellPadding: CGFloat = 20
    
    private var stackView: UIStackView?
    private var titleLabel: UILabel?
    private var contentsTextView: UITextView?
    
    override var reuseIdentifier: String? {
        "TeamInfoTableViewCell"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //
        self.clearView()
    }
    
    func setTeamInfo(_ teamInfo: TeamData.Info) {
        self.title = teamInfo.title
        self.contents = teamInfo.contents
        self.setUpUI()
        self.updateView()
    }
}


//MARK: - Set Up UI
extension TeamInfoTableViewCell {
    
    private func setUpUI() {
        self.backgroundColor = UIColor.clear
        setUpStackView()
        setUpTitleLabel()
        setUpContentsTextView()
        setUpEmptyView()
        self.selectionStyle = .none
        
    }
    
    private func setUpStackView() {
        let stackView = UIStackView()
        self.addSubview(stackView)
        stackView.backgroundColor = UIColor(named: "TeamInfoStack_BG")
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.contentMode = .scaleAspectFit
        
        //LayoutConstraint
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = stackView.topAnchor.constraint(equalTo: self.topAnchor)
        let leadingConstraint = stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailingConstraint = stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint])
        
        //Corner Round
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = self.stackViewCornerRadius
        
        self.stackView = stackView
    }
    
    private func setUpTitleLabel() {
        guard let stackView = self.stackView else { return }
        
        let titleLabel = UILabel()
        stackView.addArrangedSubview(titleLabel)
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 23)
        titleLabel.textColor = .black
        titleLabel.backgroundColor = UIColor(named: "TeamInfoTitle_BG")
        
        //LayoutConstraint
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = titleLabel.heightAnchor.constraint(equalToConstant: 28)
        
        NSLayoutConstraint.activate([heightConstraint])
        
        //Corner Round
        titleLabel.clipsToBounds = true
        titleLabel.layer.cornerRadius = self.titleLabelCornerRadius
        titleLabel.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner,.layerMaxXMaxYCorner)
        
        self.titleLabel = titleLabel
    }
    
    private func setUpContentsTextView() {
        guard let stackView = self.stackView else { return }
        
        let contentsTextView = UITextView()
        stackView.addArrangedSubview(contentsTextView)
        
        
        contentsTextView.textAlignment = .center
        contentsTextView.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        contentsTextView.contentMode = .scaleAspectFit
        
        contentsTextView.textColor = .black
        contentsTextView.backgroundColor = .clear
        
        contentsTextView.isEditable = false
        contentsTextView.isSelectable = false
        contentsTextView.isScrollEnabled = false
        
        
        //LayoutConstraint
        contentsTextView.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = contentsTextView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor)
        let trailingConstraint = contentsTextView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint])
        
        self.contentsTextView = contentsTextView
    }
    
    private func setUpEmptyView() {
        guard let stackView = self.stackView else { return }
        let emptyView = UIView()
        self.addSubview(emptyView)
        
        emptyView.backgroundColor = .clear
        
        //Constraint
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        let heightContraint = emptyView.heightAnchor.constraint(equalToConstant: cellPadding)
        let topContraint = emptyView.topAnchor.constraint(equalTo: stackView.bottomAnchor)
        let bottomContraint = emptyView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        NSLayoutConstraint.activate([heightContraint, topContraint, bottomContraint])
        
    }
}

//MARK: - Update view
extension TeamInfoTableViewCell {
    
    private func updateView() {
        updateTitleLabel()
        updateContentTextView()
    }
    
    private func updateTitleLabel() {
        guard let titleLabel = self.titleLabel else { return }
        titleLabel.text = " " + self.title + "  "
    }
    
    private func updateContentTextView() {
        guard let contentTextView = self.contentsTextView else { return }
        
        let contentString = self.contents.joined(separator: "\n")
        contentTextView.text = contentString
    }
}

//MARK: - Clear view
extension TeamInfoTableViewCell {
    
    private func clearView() {
        clearTitleLabel()
        clearContentTextView()
    }
    
    private func clearTitleLabel() {
        guard let titleLabel = self.titleLabel else { return }
        titleLabel.text = nil
    }
    
    private func clearContentTextView() {
        guard let contentTextView = self.contentsTextView else { return }
        contentTextView.text = nil
    }
}
