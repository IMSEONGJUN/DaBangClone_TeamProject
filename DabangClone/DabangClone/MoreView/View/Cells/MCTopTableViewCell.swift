//
//  MCTopTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class MCTopTableViewCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "MCTopTableViewCell"
  
  // MARK: -Property
  private let explainLable = UILabel().then {
    $0.text = "관리비 금액과 포함항목을 입력하세요"
    $0.font = .systemFont(ofSize: 16, weight: .regular)
  }
  private let maintenanceCostLabel = UILabel().then {
    $0.text = "관리비"
    $0.font = .systemFont(ofSize: 16, weight: .regular)
  }
  private let measureLabel = UILabel().then {
    $0.text = "만 원"
    $0.font = .systemFont(ofSize: 11, weight: .regular)
    $0.textColor = .lightGray
  }
  private let textField = UITextField().then {
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.addLeftPadding(20)
  }
  private let checkButton = UIButton().then {
    $0.layer.borderWidth = 1.4
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
  }
  private let checkLabel = UILabel().then {
    $0.text = "협의가능"
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .gray
  }
  private let categoryLabel = UILabel().then {
    $0.text = "포함항목"
    $0.font = .systemFont(ofSize: 16, weight: .regular)
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
      explainLable,
      maintenanceCostLabel,
      measureLabel,
      textField,
      checkButton,
      checkLabel,
      categoryLabel,
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    explainLable.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.centerX.equalToSuperview()
    }
    maintenanceCostLabel.snp.makeConstraints {
      $0.top.equalTo(explainLable.snp.bottom).offset(24)
      $0.leading.equalToSuperview().offset(24)
    }
    measureLabel.snp.makeConstraints {
      $0.top.equalTo(maintenanceCostLabel)
      $0.trailing.equalToSuperview().offset(-24)
    }
    textField.snp.makeConstraints {
      $0.top.equalTo(maintenanceCostLabel.snp.bottom).offset(12)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(50)
    }
    checkLabel.snp.makeConstraints {
      $0.top.equalTo(textField.snp.bottom).offset(16)
      $0.trailing.equalTo(-24)
      $0.height.equalTo(24)
    }
    checkButton.snp.makeConstraints {
      $0.top.equalTo(checkLabel)
      $0.trailing.equalTo(checkLabel.snp.leading).offset(-8)
      $0.width.equalTo(24)
      $0.height.equalTo(checkButton.snp.width)
    }
    categoryLabel.snp.makeConstraints {
      $0.top.equalTo(checkButton.snp.bottom).offset(10)
      $0.leading.equalTo(maintenanceCostLabel)
      $0.bottom.equalToSuperview().offset(-10)
    }
  }
}
