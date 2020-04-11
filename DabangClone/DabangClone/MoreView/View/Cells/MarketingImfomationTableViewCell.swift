//
//  MarketingImfomationTableViewCell.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class MarketingImfomationTableViewCell: UITableViewCell {

  //MARK: - Property
   static let identifier = "MarketingImfomationTableViewCell"
   let titleLabel = UILabel().then {
     $0.font = .systemFont(ofSize: 18, weight: .bold)
     $0.textColor = UIColor(named: "TitleColor")
   }
   let detailLabel = UILabel().then {
     $0.textColor = UIColor(named: "DetailColor")
     $0.lineBreakMode = NSLineBreakMode.byWordWrapping
     $0.numberOfLines = 0
     
   }
  
  //MARK: Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(title: String, detail: String){
    self.titleLabel.text = title
    self.detailLabel.text = detail
  }
  //MARK: - SETUP UI
  private func setupUI() {
    self.addSubviews([titleLabel,detailLabel])
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
      $0.bottom.equalToSuperview().offset(-20)
      $0.trailing.equalToSuperview().offset(-10)
    }
  }
}
