//
//  MCBottomTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class MCBottomTableViewCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "MCBottomTableViewCell"
  
  // MARK: -Property
  private let categoryLabel = UILabel()
  private let checkButton = UIButton().then {
    $0.layer.borderWidth = 1.4
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
  }
  
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -Action
  
  func configue(category: String) {
    categoryLabel.text = category
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    
    contentView.addSubviews([
    categoryLabel,
    checkButton,
    
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    categoryLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(24)
    }
    checkButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().offset(-24)
      $0.width.equalTo(24)
      $0.height.equalTo(checkButton.snp.width)
    }
    
  }
  

}
