//
//  NoticeTopView.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import Then
import SnapKit
class NoticeTopView: UIView {

  private let leftButton = UIButton().then {
    $0.setTitle("전체알림", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.1333196759, green: 0.1333409548, blue: 0.133312434, alpha: 1), for: .normal)
    $0.tag = 1
    $0.addTarget(self, action: #selector(didTapNoticeButton(_:)), for: .touchUpInside)
  }
  private let rightButton = UIButton().then {
    $0.setTitle("분양정보 알림", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.4117309451, green: 0.4117837548, blue: 0.4117129445, alpha: 1), for: .normal)
    $0.tag = 2
    $0.addTarget(self, action: #selector(didTapNoticeButton(_:)), for: .touchUpInside)
  }
  private let bottonView = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.1333196759, green: 0.1333409548, blue: 0.133312434, alpha: 1)
  }
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - setupUI
  private func setupUI() {
    self.addSubviews([leftButton,rightButton,bottonView])
    setupConstraints()
  }
  
  //MARK: - Layout
  private func setupConstraints() {
    bottonView.snp.makeConstraints {
      $0.bottom.leading.equalToSuperview()
      $0.trailing.equalTo(self.snp.centerX)
      $0.height.equalTo(2)
    }
    
    leftButton.snp.makeConstraints {
      $0.top.leading.equalToSuperview()
      $0.trailing.equalTo(self.snp.centerX)
      $0.bottom.equalTo(bottonView.snp.top)
    }
    rightButton.snp.makeConstraints {
      $0.top.trailing.equalToSuperview()
      $0.leading.equalTo(self.snp.centerX)
      $0.bottom.equalTo(bottonView.snp.top)
    }
    
  }
  
  
  @objc private func didTapNoticeButton(_ sender: UIButton) {
    print((self.frame.maxX - self.bottonView.frame.maxX))
    if sender.tag == 1 {
      leftButton.setTitleColor(#colorLiteral(red: 0.1333196759, green: 0.1333409548, blue: 0.133312434, alpha: 1), for: .normal)
      rightButton.setTitleColor(#colorLiteral(red: 0.4117309451, green: 0.4117837548, blue: 0.4117129445, alpha: 1), for: .normal)
      UIView.animate(withDuration: 0.5) {
        self.bottonView.transform = .identity
      }
    } else {
      leftButton.setTitleColor(#colorLiteral(red: 0.4117309451, green: 0.4117837548, blue: 0.4117129445, alpha: 1), for: .normal)
      rightButton.setTitleColor(#colorLiteral(red: 0.1333196759, green: 0.1333409548, blue: 0.133312434, alpha: 1), for: .normal)
      UIView.animate(withDuration: 0.2) {
        self.bottonView.transform = .init(translationX: self.frame.maxX - self.bottonView.frame.maxX, y: 0)
      }
    }
  }

}
