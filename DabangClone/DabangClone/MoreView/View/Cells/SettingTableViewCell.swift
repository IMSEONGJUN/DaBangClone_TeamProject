//
//  SettingTableViewCell.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import Then
import SnapKit

protocol SettingTableViewCellDelegate {
  func didTapDetailButton()
}


class SettingTableViewCell: UITableViewCell {
  
  //MARK: - Property
  static let identifier = "SettingTableViewCell"
  var delegate: SettingTableViewCellDelegate?
  let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 18, weight: .bold)
    $0.textColor = UIColor(named: "TitleColor")
  }
  let detailLabel = UILabel().then {
    $0.textColor = UIColor(named: "DetailColor")
    $0.lineBreakMode = NSLineBreakMode.byWordWrapping
    $0.numberOfLines = 0
    
  }
  let detailInfoButton = UIButton(type: .system).then {
    let title = "상세보기"
    let titleString = NSMutableAttributedString(string: title)
    titleString.addAttribute(
      .underlineStyle,
      value: NSUnderlineStyle.single.rawValue,
      range: NSRange(location: 0, length: title.count)
    )
    titleString.addAttribute(
      .foregroundColor,
      value: UIColor(named: "DetailColor") ,
      range: NSRange(location: 0, length: title.count))
    $0.setAttributedTitle(titleString, for: .normal)
  }
  let checkSwitch = UISwitch().then {
    //    $0.backgroundColor = .blue
    $0.tintColor = .blue
    $0.onTintColor = UIColor(named: "PureLoginButtonColor")
  }
  
  let buttonImageView = UIImageView()
  private var tempConstraint: NSLayoutConstraint?
  //MARK: Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(title: String, detail: String,detailCheck: Bool){
    self.titleLabel.text = title
    self.detailLabel.text = detail
    if detailCheck {
      self.addSubview(detailInfoButton)
      detailLabel.snp.makeConstraints {
        $0.bottom.equalTo(detailInfoButton.snp.top).offset(-2).priority(.high)
      }
      detailInfoButton.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(10)
        $0.bottom.equalTo(self.snp.bottom).offset(-20)
      }
    }
  }
  //MARK: - SETUP UI
  private func setupUI() {
    
    self.addSubviews([titleLabel,detailLabel,checkSwitch])
    detailInfoButton.addTarget(self, action: #selector(didTapDetailButton(_:)), for: .touchUpInside)
    setupConstraints()
  }
  
  //MARK: -  Layout
  private func setupConstraints() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.equalToSuperview().offset(10)
    }
    detailLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(4)
      $0.leading.equalToSuperview().offset(10)
      $0.trailing.equalToSuperview().offset(-50)
      $0.bottom.equalTo(self.snp.bottom).offset(-20).priority(.low)
    }
    
    checkSwitch.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.trailing.equalToSuperview().offset(-10)
    }
  }
  
  @objc private func didTapDetailButton(_ sender: UIButton) {
    print("checkBUtton")
    delegate?.didTapDetailButton()
  }
}



// 중간 발표에서 어디까지 하고 최종에서 는 어디 까지 하겠다
// 버젼 명시화 <- 환경설정


// MARK: - Identifier
// MARK: - Property
// MARK: - Init
// MARK: - Action
// MARK: - SetupUI
// MARK: - Layout



