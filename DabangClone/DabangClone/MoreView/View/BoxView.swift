//
//  BoxView.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/01.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class BoxView: UIView {
  
  let leftTitle = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    $0.textColor = .black
    $0.textAlignment = .left
    $0.text = ""
  }
  let rightButton = UIButton(type: .custom).then {
    $0.setTitle("입력하세요", for: .normal)
    $0.setTitleColor(.gray, for: .normal)
  }
  let rightChevronButton = UIButton(type: .custom).then {
    $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    $0.tintColor = .black
  }
  
  let disableButton = UIButton().then {
    $0.setTitle("불가", for: .normal)
    $0.setTitleColor(.gray, for: .normal)
    $0.layer.borderColor = UIColor.gray.cgColor
    $0.layer.borderWidth = 1
  }
  
  let enableButton = UIButton().then {
    $0.setTitle("가능", for: .normal)
    $0.setTitleColor(.gray, for: .normal)
    $0.layer.borderColor = UIColor.gray.cgColor
    $0.layer.borderWidth = 1
  }
  
  let rightNowButton = UIButton().then {
    $0.setTitle("즉시 입주", for: .normal)
    $0.setTitleColor(.gray, for: .normal)
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.gray.cgColor
  }
  
  
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
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
      $0.leading.equalToSuperview()
    }
    rightChevronButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview()
      $0.height.equalToSuperview()
    }
    rightButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalTo(rightChevronButton.snp.leading).offset(10)
      $0.height.equalToSuperview()
      $0.width.equalTo(60)
    }
  }
  
  func configure(title: String) {
    leftTitle.text = "\(title)"
    rightButton.addTarget(self, action: #selector(didTapInputButton), for: .touchUpInside)
    rightChevronButton.addTarget(self, action: #selector(didTapInputButton), for: .touchUpInside)
  }
  
  func settingAbleButton(title: String) {
    leftTitle.text = "\(title)"
    
    rightChevronButton.isHidden = true
    rightButton.isHidden = true
    
    
    //MARK: - Notification Reserve
    
    enableButton.addTarget(self, action: #selector(didTapEnableButton), for: .touchUpInside)
    
    addSubviews([disableButton, enableButton])
    ableButtonsConstraints()
    
    if leftTitle.text == "관리비" {
      disableButton.setTitle("없음", for: .normal)
      enableButton.setTitle("있음", for: .normal)
    } else if leftTitle.text == "입주 가능일" {
      addSubview(rightNowButton)
      rightNowButtonConstraints()
    }
  }
  
  private func ableButtonsConstraints() {
    enableButton.snp.makeConstraints {
      $0.trailing.equalToSuperview()
      $0.centerY.equalToSuperview()
      $0.height.equalTo(25)
      $0.width.equalTo(75)
    }
    disableButton.snp.makeConstraints {
      $0.trailing.equalTo(enableButton.snp.leading).offset(1)
      $0.width.height.equalTo(enableButton)
      $0.centerY.equalToSuperview()
    }
    
    enableButton.cornerRadiusRight()
    disableButton.cornerRadiusLeft()
  }
  
  private func rightNowButtonConstraints() {
    rightNowButton.snp.makeConstraints {
      $0.trailing.equalTo(disableButton.snp.leading).offset(1)
      $0.width.height.equalTo(enableButton)
      $0.centerY.equalToSuperview()
    }
    disableButton.layer.cornerRadius = 0
    rightNowButton.cornerRadiusLeft()
  }
  
  //MARK: - Notification Center ReserveFunction
  @objc private func didTapEnableButton() {
    NotificationCenter.default.post(name: NSNotification.Name("Enable"), object: nil, userInfo: ["buttonTitle" : leftTitle.text])
  }
  
  
  @objc private func didTapInputButton() {
    NotificationCenter.default.post(name: NSNotification.Name("Input"), object: nil, userInfo: ["buttonTitle" : leftTitle.text])
  }
}

extension UIButton {
  func cornerRadiusLeft() {
    self.layer.cornerRadius = 12.5
    self.clipsToBounds = true
    self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
  }
  
  func cornerRadiusRight() {
    self.layer.cornerRadius = 12.5
    self.clipsToBounds = true
    self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
  }
}
