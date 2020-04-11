//
//  RGTitleTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit
import Then

class RGTopTableViewCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "RGTitleTableViewCell"
  
  // MARK: -Property
  
  private let firstLine1 = UILabel().then {
    $0.text = "∙ 등록한 매물은 "
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  private let firstLine2 = UILabel().then {
    $0.text = "30일 "
    $0.textColor = UIColor(named: "roomGuideTextColor")
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  private let firstLine3 = UILabel().then {
    $0.text = "동안 노출됩니다."
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  
  private let secondLine1 = UILabel().then {
    $0.text = "∙ 작성중인 내용은 자동으로 "
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  private let secondLine2 = UILabel().then {
    $0.text = "임시저장"
    $0.textColor = UIColor(named: "roomGuideTextColor")
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  private let secondLine3 = UILabel().then {
    $0.text = "이 됩니다."
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  
  private let thirdLine1 = UILabel().then {
    $0.text = "∙ 일반 회원은 "
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  private let thirdLine2 = UILabel().then {
    $0.text = "1개"
    $0.textColor = UIColor(named: "roomGuideTextColor")
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  private let thirdLine3 = UILabel().then {
    $0.text = "의 매물만 내놓을 수 있고, "
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  private let thirdLine4 = UILabel().then {
    $0.text = "직거래"
    $0.textColor = UIColor(named: "roomGuideTextColor")
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  private let thirdLine5 = UILabel().then {
    $0.text = "  로 표시됩니다."
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
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
      firstLine1,
      firstLine2,
      firstLine3,
      secondLine1,
      secondLine2,
      secondLine3,
      thirdLine1,
      thirdLine2,
      thirdLine3,
      thirdLine4,
      thirdLine5,
      bottomLine
    ])
    
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    firstLine1.snp.makeConstraints {
      $0.leading.equalTo(contentView.snp.leading).offset(16)
      $0.top.equalTo(contentView.snp.top).offset(16)
    }
    firstLine2.snp.makeConstraints {
      $0.leading.equalTo(firstLine1.snp.trailing)
      $0.top.equalTo(contentView.snp.top).offset(16)
    }
    firstLine3.snp.makeConstraints {
      $0.leading.equalTo(firstLine2.snp.trailing)
      $0.top.equalTo(contentView.snp.top).offset(16)
    }
    
    secondLine1.snp.makeConstraints {
      $0.leading.equalTo(contentView.snp.leading).offset(16)
      $0.top.equalTo(firstLine1.snp.bottom).offset(8)
    }
    secondLine2.snp.makeConstraints {
      $0.leading.equalTo(secondLine1.snp.trailing)
      $0.top.equalTo(firstLine1.snp.bottom).offset(8)
    }
    secondLine3.snp.makeConstraints {
      $0.leading.equalTo(secondLine2.snp.trailing)
      $0.top.equalTo(firstLine1.snp.bottom).offset(8)
    }
    
    
    thirdLine1.snp.makeConstraints {
      $0.leading.equalTo(contentView.snp.leading).offset(16)
      $0.top.equalTo(secondLine1.snp.bottom).offset(8)
    }
    thirdLine2.snp.makeConstraints {
      $0.leading.equalTo(thirdLine1.snp.trailing)
      $0.top.equalTo(secondLine1.snp.bottom).offset(8)
    }
    thirdLine3.snp.makeConstraints {
      $0.leading.equalTo(thirdLine2.snp.trailing)
      $0.top.equalTo(secondLine1.snp.bottom).offset(8)
    }
    thirdLine4.snp.makeConstraints {
      $0.leading.equalTo(thirdLine3.snp.trailing)
      $0.top.equalTo(secondLine1.snp.bottom).offset(8)
    }
    thirdLine5.snp.makeConstraints {
      $0.leading.equalTo(contentView.snp.leading).offset(16)
      $0.top.equalTo(thirdLine1.snp.bottom).offset(8)
    }
    
    bottomLine.snp.makeConstraints {
      $0.bottom.equalToSuperview()
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(1)
    }
  }
  
}
