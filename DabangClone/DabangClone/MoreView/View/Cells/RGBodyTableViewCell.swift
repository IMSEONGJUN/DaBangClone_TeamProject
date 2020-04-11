//
//  RGBodyTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class RGBodyTableViewCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "RGBodyTableViewCell"
  
  // MARK: -Property
  private let firstLine = UILabel().then {
    $0.text = "매매는 방주인에서만 등록하실 수 있습니다."
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
  }
  private let secondLine = UILabel().then {
    $0.text = "소유중인 공실 매매와 매물등록을 한번에 하고 싶다면"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
  }
  private let thirdLine1 = UILabel().then {
    $0.text = """
    "방주인"
    """
    $0.textColor = UIColor(named: "roomGuideTextColor")
    $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
  }
  private let thirdLine2 = UILabel().then {
    $0.text = "을 이용해주세요."
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
  }
  
  private let roomStartButton = UIButton().then {
    $0.setTitle("방 내놓기 시작", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.backgroundColor = UIColor(named: "PureLoginButtonColor")
    $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    $0.layer.cornerRadius = 4
  }
  
  private let commentLabel = UILabel().then {
    $0.text = "*더 많은 매물 등록은 공인중개사 회원에게만 제공됩니다."
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
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
    firstLine,
    secondLine,
    thirdLine1,
    thirdLine2,
    roomStartButton,
    commentLabel
    ])
    
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    firstLine.snp.makeConstraints {
      $0.leading.equalTo(contentView.snp.leading).offset(14)
      $0.top.equalTo(contentView.snp.top).offset(28)
    }
    secondLine.snp.makeConstraints {
      $0.leading.equalTo(contentView.snp.leading).offset(14)
      $0.top.equalTo(firstLine.snp.bottom).offset(6)
    }
    thirdLine1.snp.makeConstraints {
      $0.leading.equalTo(contentView.snp.leading).offset(14)
      $0.top.equalTo(secondLine.snp.bottom).offset(6)
    }
    thirdLine2.snp.makeConstraints {
      $0.leading.equalTo(thirdLine1.snp.trailing)
      $0.top.equalTo(secondLine.snp.bottom).offset(6)
    }
    roomStartButton.snp.makeConstraints {
      $0.top.equalTo(thirdLine2.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.22)
    }
    commentLabel.snp.makeConstraints {
      $0.top.equalTo(roomStartButton.snp.bottom).offset(12)
      $0.leading.equalTo(contentView.snp.leading).offset(14)
    }
    
  }
  
}
