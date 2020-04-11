//
//  PMBottomTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/25.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

protocol PMBottomTableViewCelldelegate: class {
    func didTapSignOutButton()
}

class PMBottomTableViewCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "PMBottomTableViewCell"
  
  weak var delegate: PMBottomTableViewCelldelegate?
  
  // MARK: -Property
  
  
  let withdrawalButton = UIButton().then {
    $0.setTitle("회원탈퇴", for: .normal)
    $0.setTitleColor(UIColor(named: "grayColor"), for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
  }
  let lengthLine = UIView().then {
    $0.backgroundColor = .gray
  }
  let signOutButton = UIButton().then {
    $0.setTitle("로그아웃", for: .normal)
    $0.setTitleColor(UIColor(named: "grayColor"), for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
  }
  let csTextLabel = UILabel().then {
    $0.attributedText = NSMutableAttributedString().normal("고객센터 ", fontSize: 14).bold("02-1899-6840", fontSize: 12)
    $0.textColor = .gray
  }
  
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.backgroundColor = UIColor(named: "TextFieldColor")
    setupUI()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -action
  
  // 로그아웃 클릭시 실행되는 함수
  @objc private func didTapSignOutButton(_ sender: UIButton) {
    
    delegate?.didTapSignOutButton()
    
  }
  
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    
    contentView.addSubviews([
      lengthLine,
      withdrawalButton,
      signOutButton,
      csTextLabel,
      
    ])
    setupConstraint()
    
    signOutButton.addTarget(self, action: #selector(didTapSignOutButton(_:)), for: .touchUpInside)
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    lengthLine.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().offset(26)
      $0.height.equalTo(16)
      $0.width.equalTo(1)
    }
    withdrawalButton.snp.makeConstraints {
      $0.top.equalTo(lengthLine)
      $0.height.equalTo(lengthLine)
      $0.trailing.equalTo(lengthLine.snp.leading).offset(-12)
    }
    signOutButton.snp.makeConstraints {
      $0.top.equalTo(lengthLine)
      $0.height.equalTo(lengthLine)
      $0.leading.equalTo(lengthLine.snp.trailing).offset(12)
    }
    csTextLabel.snp.makeConstraints {
      $0.top.equalTo(lengthLine).offset(22)
      $0.centerX.equalToSuperview()
      
    }
    
  }
  
  
}
