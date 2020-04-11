//
//  ThreeSegmentTableViewCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/01.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class ThreeSegmentTableViewCell: UITableViewCell {
  
  static let identifier = "ThreeSegmentCell"
  
  let leftTitle = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    $0.textColor = .black
    $0.textAlignment = .left
    $0.text = ""
  }
  
  let isThereSegmentControl = UISegmentedControl(items: ["즉시 입주", "날짜 협의", "직접 입력"]).then {
    $0.backgroundColor = .white
    $0.tintColor = .blue
    $0.forcedImplementBackgroundColor()
    $0.layer.borderColor = UIColor.gray.cgColor
    $0.layer.borderWidth = 1
    $0.clipsToBounds = true
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
    addSubviews([leftTitle, isThereSegmentControl])
    setupCosntraints()
  }
  private func setupCosntraints() {
    leftTitle.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().inset(20)
    }
    
    isThereSegmentControl.snp.makeConstraints {
      $0.trailing.equalToSuperview().inset(20)
      $0.centerY.equalToSuperview()
      $0.height.equalTo(25)
      $0.width.equalTo(225)
    }
  }
  
  func configure(title: BaseInfo = .빈케이스, AdditionalTitle: AdditionalInfo = .빈케이스) {
    if title != BaseInfo.빈케이스 {
      leftTitle.text = "\(title.setTitle())"
    } else if AdditionalTitle != AdditionalInfo.빈케이스 {
      leftTitle.text = "\(AdditionalTitle.setTitle())"
    }
    if AdditionalTitle == .난방종류 {
      isThereSegmentControl.setTitle("중앙", forSegmentAt: 0)
      isThereSegmentControl.setTitle("개별", forSegmentAt: 1)
      isThereSegmentControl.setTitle("지역", forSegmentAt: 2)
    }
  }
  
}
