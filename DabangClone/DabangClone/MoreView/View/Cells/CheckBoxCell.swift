//
//  CheckBoxCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/01.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class CheckBoxCell: UITableViewCell {
  
  static let identifier = "CheckBoxCell"
  
  let leftTitle = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    $0.textColor = .black
    $0.textAlignment = .left
    $0.text = ""
  }
  
  let checkBox = UIButton().then {
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.gray.cgColor
    $0.layer.cornerRadius = 2
    $0.backgroundColor = .white
    
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    addSubviews([leftTitle, checkBox])
    setupCosntraints()
  }
  
  private func setupCosntraints() {
    leftTitle.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().inset(20)
    }
    
    checkBox.snp.makeConstraints {
      $0.centerY.equalTo(leftTitle)
      $0.trailing.equalToSuperview().inset(20)
      $0.width.height.equalTo(30)
      
    }
  }
  
  func configure(title: BaseInfo = .빈케이스, AdditionalTitle: AdditionalInfo = .빈케이스) {
    if title != BaseInfo.빈케이스 {
      leftTitle.text = "\(title.setTitle())"
    } else if AdditionalTitle != AdditionalInfo.빈케이스 {
      leftTitle.text = "\(AdditionalTitle.setTitle())"
    }
  }
  
}
