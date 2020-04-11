//
//  AddRoomView.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/27.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import Then
import SnapKit
class AddRoomTitleView: UIView {

  
  //MARK: - Property
  private let titleLabel = UILabel().then {
    $0.textColor = #colorLiteral(red: 0.3999670744, green: 0.4000185132, blue: 0.3999494314, alpha: 1)
  }
  private let detailLabel = UILabel().then {
    $0.text = "입력하세요"
  }
  private let leftImageView = UIImageView()
  private let rightImageView = UIImageView().then {
    $0.image = UIImage(systemName: "chevron.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
//    $0.setImage(UIImage(systemName: "chevron.right", withConfiguration: smallConfiguration)?.withTintColor(., renderingMode: .alwaysOriginal), for: .normal)
//    $0.setImage(UIImage(systemName: "chevron.right", withConfiguration: smallConfiguration), for: .n)
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = #colorLiteral(red: 0.9528682828, green: 0.9529824853, blue: 0.9528294206, alpha: 1)
    setupUI()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - SETUP UI
  private func setupUI() {
    self.addSubviews([titleLabel, detailLabel, leftImageView, rightImageView])
    setupConstraints()
  }
  
  //MARK: -  Layout
  private func setupConstraints() {
    leftImageView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(10)
      $0.height.width.equalTo(titleLabel.snp.height)
    }
    titleLabel.snp.makeConstraints {
      $0.leading.equalTo(leftImageView.snp.trailing).offset(10)
      $0.centerY.equalToSuperview()
    }
    
    rightImageView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().offset(-10)
      $0.height.width.equalTo(titleLabel.snp.height)
    }
    
    detailLabel.snp.makeConstraints {
      $0.trailing.equalTo(rightImageView.snp.leading).offset(-10)
      $0.centerY.equalToSuperview()
    }
  }
  
  func configure(title: String, Image: String){
    self.titleLabel.text = title
    self.leftImageView.image = UIImage(named: Image)
  }
}
