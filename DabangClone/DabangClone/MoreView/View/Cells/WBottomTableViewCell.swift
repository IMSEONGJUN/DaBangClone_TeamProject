//
//  WBottomTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/27.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class WBottomTableViewCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "WBottomTableViewCell"
  
  // MARK: -Property
  
  let completeButton = UIButton().then {
    $0.setTitle("탈퇴 완료", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.7097486854, green: 0.7098352313, blue: 0.7097191215, alpha: 1), for: .normal)
    $0.layer.borderWidth = 0.8
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.backgroundColor = #colorLiteral(red: 0.9951116443, green: 1, blue: 0.9956502318, alpha: 1)
//    $0.addTarget(self, action: #selector(didTapCompleteButton), for: .touchUpInside)
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
  
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubviews([
    completeButton
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    completeButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(24)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(50)
      $0.bottom.equalToSuperview().offset(-100)
    }
    
  }
  

}
