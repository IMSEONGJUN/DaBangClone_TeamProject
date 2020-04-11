//
//  EventTableViewCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/29.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
  
  //MARK: - Identifier
  static let identifier = "EventCell"
  
  //MARK: - Property
  
  let titleLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    $0.text = "title"
    $0.addCharacterSpacing(kernValue: -4)
  }
  
  //진행중 & 종료
  let isDoneLabel = UILabel().then {
    $0.layer.borderWidth = 0.7
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.font = UIFont.systemFont(ofSize: 11, weight: .regular)
    $0.text = "종료"
    $0.textColor = .lightGray
    $0.textAlignment = .center
  }
  let keepGoingLabel = UILabel().then {
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor(named: "DabangLightBlue")?.cgColor
    $0.font = UIFont.systemFont(ofSize: 11, weight: .regular)
    $0.text = "진행중"
    $0.textAlignment = .center
    $0.textColor = UIColor(named: "DabangLightBlue")

  }
  let isDoneView = UIView()
  
  //날짜 레이블
  let dateLabel = UILabel().then {
    $0.text = "어떤 날 ~ 어떤 날"
    $0.textColor = .gray
    $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
  }
  
  //d-Day Lable, 당첨자 확인 버튼
  let dDayLabel = UILabel().then {
    $0.text = "D - 5"
    $0.textColor = UIColor(named: "PureLoginButtonColor")
    $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    $0.textAlignment = .right
  }
  let checkButton = UIButton().then {
    $0.layer.borderColor = UIColor.gray.cgColor
    $0.layer.cornerRadius = 2
    $0.layer.borderWidth = 0.7
    $0.setTitleColor(.gray, for: .normal)
    $0.setTitle("당첨자 확인", for: .normal)
    $0.titleLabel!.font = UIFont.systemFont(ofSize: 13, weight: .regular)
//    $0.titleLabel!.addCharacterSpacing(kernValue: -1)
  }
  let dDayView = UIView()
  
  //Event ImageView
  let eventImageView = UIImageView()
  
  
  //MARK: UITableViewCell init
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: setupUI & Constraints
  private func setupUI() {
    contentView.addSubviews([titleLabel, isDoneView, dateLabel, dDayView, eventImageView])
    isDoneView.addSubviews([isDoneLabel, keepGoingLabel])
    dDayView.addSubviews([dDayLabel, checkButton])
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.equalToSuperview().offset(20)
    }
    
    isDoneView.snp.makeConstraints {
      $0.leading.equalTo(titleLabel)
      $0.top.equalTo(titleLabel.snp.bottom).offset(3)
      $0.width.equalTo(37)
      $0.height.equalTo(18)
    }
    
    isDoneLabel.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    keepGoingLabel.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    dateLabel.snp.makeConstraints {
      $0.centerY.equalTo(isDoneView)
      $0.leading.equalTo(isDoneView.snp.trailing).offset(8)
    }
    
    dDayView.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-20)
      $0.centerY.equalTo(isDoneView.snp.top)
      $0.width.equalTo(80)
      $0.height.equalTo(31)
    }
    dDayLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview()
    }
    checkButton.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    eventImageView.snp.makeConstraints {
      $0.top.equalTo(isDoneView.snp.bottom).offset(10)
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.bottom.equalToSuperview().offset(-20)
    }
  }
  
  //MARK: - Configure
  func configure(model: EventModel) {
    let cellModel = model
    titleLabel.text = cellModel.title
    if cellModel.isDone {
      keepGoingLabel.isHidden = true
      dDayLabel.isHidden = true
    } else {
      isDoneLabel.isHidden = true
      checkButton.isHidden = true
      dDayLabel.text = "D - \(cellModel.dDay.magnitude)"
    }
    dateLabel.text = cellModel.date
    if !cellModel.needCheck {
      dDayView.isHidden = true
    }
    
    eventImageView.image = UIImage(named: cellModel.imageURL)
  }
}
