//
//  WTopTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/27.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit
import Then

protocol WTopTableViewCelldelegate: class {
    func didTapReasonButton()
}

class WTopTableViewCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "WTopTableViewCell"
  
  weak var delegate: WTopTableViewCelldelegate?
  
  // MARK: -Property
  let noticeLabel = UILabel().then {
    $0.text = """
    회원탈퇴를 신청하기전에
    아래 안내 사항을 한 번 더 확인해주세요.
    """
    $0.numberOfLines = 2
    $0.textAlignment = .center
    $0.font = .systemFont(ofSize: 16, weight: .regular)
  }
  let guideLabel1 = UILabel().then {
    $0.text = "1. 회원 탈퇴 시, 현재 로그인된 아이디는 즉시 탈퇴 처리됩니다."
    $0.font = .systemFont(ofSize: 12, weight: .regular)
  }
  let guideLabel2 = UILabel().then {
    $0.text = "2. 회원 탈퇴 시, 회원 전용 웹 서비스 이용이 불가합니다."
    $0.font = .systemFont(ofSize: 12, weight: .regular)
  }
  let guideLabel3 = UILabel().then {
    $0.text = """
    3. 탈퇴 시 회원 정보 및 찜 서비스, 등록한 게시물 이용 기록이
    모두 삭제됩니다.
    """
    $0.numberOfLines = 2
    $0.font = .systemFont(ofSize: 12, weight: .regular)
  }
  let guideLabel4 = UILabel().then {
    $0.text = """
    4. 회원 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는
    복구되지 않습니다.
    """
    $0.numberOfLines = 2
    $0.font = .systemFont(ofSize: 12, weight: .regular)
  }
  let guideLabel5 = UILabel().then {
    $0.text = """
    5. 광고를 위한 매물이 등록되어 있을 경우, 탈퇴 시 모든 정보는
    삭제 처리됩니다.
    """
    $0.numberOfLines = 2
    $0.font = .systemFont(ofSize: 12, weight: .regular)
  }
  let squareLabel = UILabel().then {
    $0.backgroundColor = .clear
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
  }
  let reasonButton = UIButton().then {
    $0.setTitle("탈퇴사유를 선택해주세요", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.contentHorizontalAlignment = .left
    
  }
  let rightArrowImage = UIImageView().then {
    $0.image = UIImage(named: "miniRightArrow")
  }
  
  let textView = UITextView().then {
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.addLeftPadding()
    $0.font = .systemFont(ofSize: 14)
  }
  let checkLabel = UILabel().then {
    $0.text = "안내사항을 모두 확인하였으며, 이에 동의합니다."
    $0.font = .systemFont(ofSize: 14)
  }
  let checkButton = UIButton().then {
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
//    $0.backgroundColor
    
//    $0.setTitleColor(UIColor(named: "regulationColor"), for: .selected)
//    $0.setBackgroundImage(UIImage(named: "regulationColor"), for: .selected)
//    $0.back
  }
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -Action
  
  @objc private func didTapReasonButton(_ sender: UIButton) {
    
    delegate?.didTapReasonButton()
    
  }
  
  // 체크버튼클릭시 색변경
  @objc private func didTapCheckButton() {
    if checkButton.isSelected == false {
    checkButton.backgroundColor = UIColor(named: "DabangLightBlue")
    checkButton.setTitle("✓", for: .normal)
    checkButton.setTitleColor(.white, for: .normal)
    checkButton.layer.borderColor = UIColor.white.cgColor
      checkButton.isSelected = true
    } else {
      checkButton.backgroundColor = .white
      checkButton.setTitle("", for: .normal)
      checkButton.layer.borderColor = UIColor.lightGray.cgColor
      checkButton.isSelected = false
    }
  }
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    
    contentView.addSubviews([
      noticeLabel,
      guideLabel1,
      guideLabel2,
      guideLabel3,
      guideLabel4,
      guideLabel5,
      squareLabel,
      textView,
      checkLabel,
      checkButton,
    ])
    
    squareLabel.addSubviews([rightArrowImage, reasonButton])
    
    textView.delegate = self
    textView.text = "다른 사유가 있다면 입력해주세요."
    textView.textColor = UIColor.lightGray
//    reasonButton.isHidden = true
    reasonButton.addTarget(self, action: #selector(didTapReasonButton), for: .touchUpInside)
    checkButton.addTarget(self, action: #selector(didTapCheckButton), for: .touchUpInside)
    setupConstraint()
  }
  
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    noticeLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().offset(26)
    }
    guideLabel1.snp.makeConstraints {
      $0.top.equalTo(noticeLabel.snp.bottom).offset(28)
      $0.leading.equalTo(20)
    }
    guideLabel2.snp.makeConstraints {
      $0.top.equalTo(guideLabel1.snp.bottom).offset(26)
      $0.leading.equalTo(guideLabel1)
    }
    guideLabel3.snp.makeConstraints {
      $0.top.equalTo(guideLabel2.snp.bottom).offset(26)
      $0.leading.equalTo(guideLabel1)
    }
    guideLabel4.snp.makeConstraints {
      $0.top.equalTo(guideLabel3.snp.bottom).offset(26)
      $0.leading.equalTo(guideLabel1)
    }
    guideLabel5.snp.makeConstraints {
      $0.top.equalTo(guideLabel4.snp.bottom).offset(26)
      $0.leading.equalTo(guideLabel1)
    }
    squareLabel.snp.makeConstraints {
      $0.top.equalTo(guideLabel5.snp.bottom).offset(26)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(50)
    }
    reasonButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalTo(16)
      $0.height.equalTo(squareLabel)
      $0.width.equalTo(squareLabel).multipliedBy(0.96)
    }
    rightArrowImage.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalTo(-16)
    }
    textView.snp.makeConstraints {
      $0.top.equalTo(squareLabel.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(squareLabel).multipliedBy(2.4)
    }
    checkLabel.snp.makeConstraints {
      $0.top.equalTo(textView.snp.bottom).offset(26)
      $0.leading.equalTo(16)
      $0.bottom.equalToSuperview().offset(-26)
    }
    checkButton.snp.makeConstraints {
      $0.top.equalTo(checkLabel)
      $0.trailing.equalToSuperview().offset(-18)
      $0.width.equalTo(24)
      $0.height.equalTo(checkButton.snp.width)
    }
  }
}

extension WTopTableViewCell: UITextViewDelegate {
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == UIColor.lightGray {
      textView.text = nil
      textView.textColor = UIColor.black
    }
  }
  
  // TextView Place Holder
  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
      textView.text = "다른 사유가 있다면 입력해주세요."
      textView.textColor = UIColor.lightGray
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.endEditing(true)
  }
  
}



