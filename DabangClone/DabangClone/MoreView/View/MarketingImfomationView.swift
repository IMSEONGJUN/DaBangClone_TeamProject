//
//  MarketingImfomationView.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class MarketingImfomationView: UIView {
  
 
  private let titleLabel = UILabel().then {
    $0.textColor = #colorLiteral(red: 0.3999670744, green: 0.4000185132, blue: 0.3999494314, alpha: 1)
    $0.lineBreakMode = NSLineBreakMode.byWordWrapping
    $0.numberOfLines = 0
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    setupUI()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - SETUP UI
  private func setupUI() {
    self.addSubviews([titleLabel])
    setupConstraints()
  }
  
  //MARK: -  Layout
  private func setupConstraints() {
    titleLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(10)
      $0.top.equalToSuperview().offset(2)
      $0.bottom.equalToSuperview().offset(-2)
    }
  }
  
  func configure(title: String){
    self.titleLabel.text = title
  }
  
}
