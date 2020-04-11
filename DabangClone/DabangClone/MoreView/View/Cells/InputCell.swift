//
//  InputCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/01.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class InputCell: UITableViewCell {
  
  static let identifier = "InputCell"
  
  let leftTitle = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    $0.textColor = .black
    $0.textAlignment = .left
    $0.text = ""
  }
  let rightButton = UIButton(type: .custom).then {
    $0.setTitle("입력하세요", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    $0.setTitleColor(.gray, for: .normal)
  }
  let rightChevronButton = UIButton(type: .custom).then {
    $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    $0.tintColor = .black
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
    addSubviews([leftTitle, rightButton, rightChevronButton])

    setupConstraints()
  }
  
  private func setupConstraints() {
    leftTitle.snp.makeConstraints {
         $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().inset(20)
       }
       rightChevronButton.snp.makeConstraints {
         $0.centerY.equalToSuperview()
         $0.trailing.equalToSuperview().inset(20)
         $0.height.equalToSuperview()
       }
       rightButton.snp.makeConstraints {
         $0.centerY.equalToSuperview()
         $0.trailing.equalTo(rightChevronButton.snp.leading).offset(10)
         $0.height.equalToSuperview()
         $0.width.equalTo(100)
       }
  }
  
  func configure(title: BaseInfo = .빈케이스, AdditionalTitle: AdditionalInfo = .빈케이스) {
    if title != BaseInfo.빈케이스 {
      leftTitle.text = "\(title.setTitle())"
    } else if AdditionalTitle != AdditionalInfo.빈케이스 {
      leftTitle.text = "\(AdditionalTitle.setTitle())"
    }
    if AdditionalTitle == .준공년도 {
      self.rightChevronButton.isHidden = true
      self.rightButton.isHidden = true
    }
  }
  
  
}
