//
//  PMTopTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/25.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit
import Then

class PMTopTableViewCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "PMTopTableViewCell"
  
  // MARK: -Property
  private let userName = "Eunyuni"
  private let userEmail = "user@user.com"
  
  private let userNameLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    $0.textAlignment = .left
    $0.text = "Eunyuni"
  }
  private let userEmailLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 14, weight: .light)
    $0.textAlignment = .left
    $0.text = "user@user.com"
    $0.textColor = .gray
  }
  private let profilePhotoImageView = UIImageView().then {
    $0.image = UIImage(named: "profileImage")
  }
  private let addProfilePhotoImageButton = UIButton().then {
    $0.setImage(UIImage(named: "addProfileImage"), for: .normal)
  }

  private let bottomLine = UIView().then {
    $0.backgroundColor = .gray
    $0.alpha = 0.4
  }

  
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
    
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubviews([
    userNameLabel,
    userEmailLabel,
    profilePhotoImageView,
    addProfilePhotoImageButton,
    bottomLine,
//    bottomGrayView,
    
    ])
    
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    userNameLabel.snp.makeConstraints {
//      $0.top.equalToSuperview().offset(65)
      $0.bottom.equalTo(contentView.snp.centerY)
      $0.leading.equalToSuperview().offset(16)
    }
    
    userEmailLabel.snp.makeConstraints {
      $0.top.equalTo(userNameLabel.snp.bottom).offset(2)
      $0.leading.equalTo(userNameLabel)
    }
    
    profilePhotoImageView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().offset(-16)
      $0.width.equalToSuperview().multipliedBy(0.169)
      $0.height.equalTo(self.snp.width).multipliedBy(0.169)
    }
    
    addProfilePhotoImageButton.snp.makeConstraints {
      $0.bottom.trailing.equalTo(profilePhotoImageView)
      $0.width.height.equalTo(profilePhotoImageView.snp.width).multipliedBy(0.36)
    }
    
    bottomLine.snp.makeConstraints {
      $0.bottom.equalToSuperview()
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.equalTo(1)
    }

    

  }
  
}
