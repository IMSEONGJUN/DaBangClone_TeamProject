//
//  SellMyRoomTableViewCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/26.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class SellMyRoomTableViewCell: UITableViewCell {
  
  static let identifier = "SellMyRoomCell"
  
  lazy var choiceNum = 0
  
  let choiceViewZero = UIView()
  let choiceLabelZero = UILabel().then {
    $0.tag = 0
  }
  let choiceCircleZero = UIImageView().then {
    $0.layer.cornerRadius = $0.frame.height/2
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.gray.cgColor
    // 뷰의 경계에 맞춰준다
    $0.clipsToBounds = true
  }
  let choicedBlueCircleZero = UIImageView().then {
    $0.layer.cornerRadius = $0.frame.height/2
    $0.layer.backgroundColor = UIColor.blue.cgColor
    // 뷰의 경계에 맞춰준다
    $0.clipsToBounds = true
  }
  
  let choiceViewOne = UIView()
  let choiceLabelOne = UILabel().then {
    $0.tag = 1
  }
  let choiceCircleOne = UIImageView().then {
    $0.layer.cornerRadius = $0.frame.height/2
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.gray.cgColor
    // 뷰의 경계에 맞춰준다
    $0.clipsToBounds = true
  }
  
  let choicedBlueCircleOne = UIImageView().then {
    $0.layer.cornerRadius = $0.frame.height/2
    $0.layer.backgroundColor = UIColor.blue.cgColor
    // 뷰의 경계에 맞춰준다
    $0.clipsToBounds = true
  }
  
  let choiceViewTwo = UIView()
  let choiceLabelTwo = UILabel().then {
    $0.tag = 2
  }
  let choiceCircleTwo = UIImageView().then {
    $0.layer.cornerRadius = $0.frame.height/2
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.gray.cgColor
    // 뷰의 경계에 맞춰준다
    $0.clipsToBounds = true
  }
  let choicedBlueCircleTwo = UIImageView().then {
    $0.layer.cornerRadius = $0.frame.height/2
    $0.layer.backgroundColor = UIColor.blue.cgColor
    // 뷰의 경계에 맞춰준다
    $0.clipsToBounds = true
  }
  
  let choiceViewThree = UIView()
  let choiceLabelThree = UILabel().then {
    $0.tag = 3
  }
  
  let choiceCircleThree = UIImageView().then {
    $0.layer.cornerRadius = $0.frame.height/2
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.gray.cgColor
    // 뷰의 경계에 맞춰준다
    $0.clipsToBounds = true
  }
  
  let choicedBlueCircleThree = UIImageView().then {
    $0.layer.cornerRadius = $0.frame.height/2
    $0.layer.backgroundColor = UIColor.blue.cgColor
    // 뷰의 경계에 맞춰준다
    $0.clipsToBounds = true
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  func setupUI() {
    print("setup UI in this Cell")
    setupContstraints()
  }
  
  func setupContstraints() {
    switch choiceNum {
    case 0:
      choiceViewThree.removeFromSuperview()
      choiceViewTwo.removeFromSuperview()
      choiceViewOne.removeFromSuperview()
      choiceViewZero.removeFromSuperview()
      
      print("case0")
    case 2:
      //One
      addSubviews([choiceViewZero, choiceViewOne])
      choiceViewZero.addSubviews([choiceCircleZero, choiceLabelZero])
      choiceCircleZero.addSubview(choicedBlueCircleZero)
      choiceViewOne.addSubviews([choiceCircleOne, choiceLabelOne])
      choiceCircleOne.addSubviews([choicedBlueCircleOne])
      choiceNumTwo()
      
      choiceViewThree.removeFromSuperview()
      choiceViewTwo.removeFromSuperview()
      
      print("case2")
      
      print("function choiceNumTwo is worked")
    case 4:
      //Three
      addSubviews([choiceViewZero, choiceViewOne, choiceViewTwo, choiceViewThree])
      choiceViewZero.addSubviews([choiceCircleZero, choiceLabelZero])
      choiceCircleZero.addSubview(choicedBlueCircleZero)
      choiceViewOne.addSubviews([choiceCircleOne, choiceLabelOne])
      choiceCircleOne.addSubviews([choicedBlueCircleOne])
      choiceViewTwo.addSubviews([choiceCircleTwo, choiceLabelTwo])
      choiceCircleTwo.addSubviews([choicedBlueCircleTwo])
      choiceViewThree.addSubviews([choiceCircleThree, choiceLabelThree])
      choiceCircleThree.addSubviews([choicedBlueCircleThree])
      choiceNumFour()
      
      print("case4")
      print("function choiceNumFour is worked")
    default:
      break
    }
  }
  
  private func choiceNumOne() {
    choiceViewZero.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.equalToSuperview().offset(15)
      $0.width.equalTo(150)
      $0.height.equalTo(30)
    }
    
    choiceCircleZero.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview()
      $0.width.height.equalTo(choiceViewZero.snp.height)
    }
    
    choicedBlueCircleZero.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4))
    }
    
    choiceLabelZero.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalTo(choiceCircleZero.snp.trailing).offset(5)
    }
  }
  
  private func choiceNumTwo() {
    choiceNumOne()
    choiceViewOne.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.equalTo(snp.centerX).offset(15)
      $0.width.equalTo(150)
      $0.height.equalTo(30)
    }
    
    choiceCircleOne.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview()
      $0.width.height.equalTo(choiceViewOne.snp.height)
    }
    
    choicedBlueCircleOne.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4))
    }
    
    choiceLabelOne.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalTo(choiceCircleOne.snp.trailing).offset(5)
    }
  }
  
  private func choiceNumThree() {
    choiceNumOne()
    choiceNumTwo()
    choiceViewTwo.snp.makeConstraints {
      $0.top.equalTo(choiceViewZero.snp.bottom).offset(20)
      $0.leading.equalToSuperview().offset(15)
      $0.width.equalTo(150)
      $0.height.equalTo(30)
    }
    
    choiceCircleTwo.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview()
      $0.width.height.equalTo(choiceViewTwo.snp.height)
    }
    
    choicedBlueCircleTwo.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4))
    }
    
    choiceLabelTwo.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalTo(choiceCircleTwo.snp.trailing).offset(5)
    }
  }
  
  private func choiceNumFour() {
    choiceNumOne()
    choiceNumTwo()
    choiceNumThree()
    choiceViewThree.snp.makeConstraints {
      $0.top.equalTo(choiceViewTwo)
      $0.leading.equalTo(snp.centerX).offset(15)
      $0.width.equalTo(150)
      $0.height.equalTo(30)
//      $0.bottom.equalToSuperview().offset(10)
    }
    
    choiceCircleThree.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview()
      $0.width.height.equalTo(choiceViewThree.snp.height)
    }
    
    choicedBlueCircleThree.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4))
    }
    
    choiceLabelThree.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalTo(choiceCircleThree.snp.trailing).offset(5)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

