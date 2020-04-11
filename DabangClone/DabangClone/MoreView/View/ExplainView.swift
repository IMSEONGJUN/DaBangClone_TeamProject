//
//  ExplainView.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class ExplainView: UIView {
  
  
  // MARK: -Property
  private let boxView = UIView().then {
    $0.layer.cornerRadius = 4
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
  }
  private let explainLabel = UILabel().then {
    $0.text = "최대한 자세하게 설명하세요"
    $0.font = .systemFont(ofSize: 14, weight: .regular)
  }
  private let roomLabel = UILabel().then {
    $0.text = "방 제목"
    $0.font = .systemFont(ofSize: 16, weight: .regular)
  }
  private let roomCountLabel = UILabel().then {
    $0.text = "0 / 20"
    $0.font = .systemFont(ofSize: 12, weight: .light)
    $0.textColor = .lightGray
  }
  private let roomTextField = UITextField().then {
    $0.placeholder = "예) 햇빛 좋은 방"
    $0.addLeftPadding(20)
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
  }
  private let detailLabel = UILabel().then {
    $0.text = "상세설명"
    $0.font = .systemFont(ofSize: 16, weight: .regular)
  }
  private let detailCountLabel = UILabel().then {
    $0.text = "0 / 500"
    $0.font = .systemFont(ofSize: 12, weight: .light)
    $0.textColor = .lightGray
  }
  private let detailTextView = UITextView().then {
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.addLeftPadding()
    $0.font = .systemFont(ofSize: 14)
  }
  private let bottomLabel = UILabel().then {
    $0.text = """
    해당 방과 관계 없는 내용을 입력할 시 비공개 처리됩니다. 예)이메일,
    전화번호, URL, SNS ID, 중개수수료 공짜/무료/반값 등
    """
    $0.font = .systemFont(ofSize: 11, weight: .regular)
    $0.textColor = .lightGray
    $0.numberOfLines = 2
    $0.textAlignment = .center
  }
  
  // MARK: -init
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    //    self.backgroundColor = .cyan
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    self.addSubviews([
      boxView,
      explainLabel,
      roomLabel,
      roomCountLabel,
      roomTextField,
      detailLabel,
      detailCountLabel,
      detailTextView,
      bottomLabel,
    ])
    
    detailTextView.delegate = self
    detailTextView.text = """
    지역의 편리한 점, 주변 이웃 분위기 등 이 방의
    특징을 최대한 자세하게 작성
    """
//    detailTextView.
    detailTextView.textColor = UIColor.lightGray
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    boxView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(8)
      $0.leading.equalToSuperview().offset(8)
      $0.trailing.equalToSuperview().offset(-8)
      $0.bottom.equalToSuperview().offset(-8)
    }
    explainLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(32)
      $0.centerX.equalToSuperview()
    }
    roomLabel.snp.makeConstraints {
      $0.top.equalTo(explainLabel.snp.bottom).offset(32)
      $0.leading.equalToSuperview().offset(24)
    }
    roomCountLabel.snp.makeConstraints {
      $0.top.equalTo(roomLabel)
      $0.trailing.equalToSuperview().offset(-24)
    }
    roomTextField.snp.makeConstraints {
      $0.top.equalTo(roomLabel.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.88)
      $0.height.equalTo(50)
    }
    detailLabel.snp.makeConstraints {
      $0.top.equalTo(roomTextField.snp.bottom).offset(32)
      $0.leading.equalTo(roomLabel)
    }
    detailCountLabel.snp.makeConstraints {
      $0.top.equalTo(detailLabel)
      $0.trailing.equalTo(roomCountLabel)
    }
    detailTextView.snp.makeConstraints {
      $0.top.equalTo(detailLabel.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.88)
      $0.height.equalTo(roomTextField).multipliedBy(2.4)
    }
    bottomLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-44)
    }
    
  }
  
  
}

extension ExplainView: UITextViewDelegate {
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == UIColor.lightGray {
      textView.text = nil
      textView.textColor = UIColor.black
    }
  }
  
  // TextView Place Holder
  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
      textView.text = """
      지역의 편리한 점, 주변 이웃 분위기 등 이 방의
      특징을 최대한 자세하게 작성
      """
      textView.textColor = UIColor.lightGray
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.endEditing(true)
  }
  
}
