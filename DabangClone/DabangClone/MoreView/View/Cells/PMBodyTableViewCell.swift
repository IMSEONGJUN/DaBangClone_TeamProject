//
//  PMBodyTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/25.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class PMBodyTableViewCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "PMBodyTableViewCell"
  
  // MARK: -Property
  
  private let bottomGrayView = UIView().then {
    $0.backgroundColor = UIColor(named: "TextFieldColor")
  }
  let nameLabel = UILabel().then {
    $0.text = "이름"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
  }
  
  let phoneNumberLabel = UILabel().then {
    $0.text = "휴대폰 번호"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
  }
  
  
  let nameTextField = UITextField().then {
    $0.placeholder = "사용자 이름"
    $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.addLeftPadding(20)
  }
  
  let phoneNumberTextField = UITextField().then {
    $0.placeholder = "사용자 폰번호"
    $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.addLeftPadding(20)
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
      bottomGrayView,
      nameLabel,
      phoneNumberLabel,
      nameTextField,
      phoneNumberTextField,
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    bottomGrayView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.equalTo(10)
    }
    
    nameLabel.snp.makeConstraints {
      $0.leading.equalTo(24)
      $0.top.equalTo(bottomGrayView.snp.bottom).offset(24)
    }
    nameTextField.snp.makeConstraints {
      $0.top.equalTo(nameLabel.snp.bottom).offset(20)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(50)
    }
    phoneNumberLabel.snp.makeConstraints {
      $0.leading.equalTo(24)
      $0.top.equalTo(nameTextField.snp.bottom).offset(24)
    }
    phoneNumberTextField.snp.makeConstraints {
      $0.top.equalTo(phoneNumberLabel.snp.bottom).offset(20)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(nameTextField)
      $0.bottom.equalTo(contentView.snp.bottom).offset(-24)
    }
  }
  
  
}
