//
//  BaseInfoView.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class BaseInfoView: UIView {
  
  //MARK: - Property
  let grayView = UIView().then {
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.gray.cgColor
    $0.layer.cornerRadius = 4
  }
  
  let titleBoxView = UIView()
  let titleLabel = UILabel().then {
    $0.textAlignment = .center
    $0.font = UIFont.systemFont(ofSize: 14, weight: .light)
    $0.textColor = .black
    $0.text = "가장 중요한 정보이므로 정확히 입력하세요."
  }
  let costBox = BoxView().then {
    $0.configure(title: "가격")
  }
  let floorBox = BoxView().then {
    $0.configure(title: "층 수")
  }
  let sizeBox = BoxView().then {
    $0.configure(title: "방 크기")
  }
  let shotRentBox = BoxView().then {
    $0.settingAbleButton(title: "단기임대")
  }
  let billForCareBox = BoxView().then {
    $0.settingAbleButton(title: "관리비")
  }
  let parkingBox = BoxView().then {
    $0.settingAbleButton(title: "주차")
  }
  
  let dateToIn = BoxView().then {
     $0.settingAbleButton(title: "입주 가능일")
   }
  
  //MARK: - Life Cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK: - Setup UI & Constraints
  private func setupUI() {
    addSubviews([grayView])
    grayView.addSubviews([titleBoxView, costBox, floorBox, sizeBox, shotRentBox, billForCareBox, parkingBox, dateToIn])
    titleBoxView.addSubview(titleLabel)
    setupConstraints()
  }
  
  private func setupConstraints() {
    grayView.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
    titleBoxView.snp.makeConstraints {
      $0.leading.top.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
      $0.height.equalTo(50)
    }
    titleLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    costBox.snp.makeConstraints {
      $0.top.equalTo(titleBoxView.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
      $0.height.equalTo(titleBoxView)
    }
    floorBox.snp.makeConstraints {
      $0.top.equalTo(costBox.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
      $0.height.equalTo(titleBoxView)
    }
    sizeBox.snp.makeConstraints {
      $0.top.equalTo(floorBox.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
      $0.height.equalTo(titleBoxView)
    }
    
    shotRentBox.snp.makeConstraints {
      $0.top.equalTo(sizeBox.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
      $0.height.equalTo(titleBoxView)
    }
    
    billForCareBox.snp.makeConstraints {
      $0.top.equalTo(shotRentBox.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
      $0.height.equalTo(titleBoxView)
    }
    
    parkingBox.snp.makeConstraints {
      $0.top.equalTo(billForCareBox.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
      $0.height.equalTo(titleBoxView)
    }
    dateToIn.snp.makeConstraints {
      $0.top.equalTo(parkingBox.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
      $0.height.equalTo(titleBoxView)
    }
  }
  
}




