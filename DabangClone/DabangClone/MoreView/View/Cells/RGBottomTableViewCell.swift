//
//  RGBottomTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class RGBottomTableViewCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "RGBottomTableViewCell"
  
  // MARK: -Property
  private let dabangLogoImage = UIImageView().then {
    $0.image = UIImage(named: "roomGuideDabangLogo")
  }
  private let explanationLabel1 = UILabel().then {
    $0.text = "집주인님~ 지금도 늦지 않았어요."
    $0.font = UIFont.systemFont(ofSize: 14, weight: .light)
  }
  private let explanationLabel2 = UILabel().then {
    $0.text = "더 많은 매물등록과 매매를 한번에 하세요!"
    $0.font = UIFont.systemFont(ofSize: 14, weight: .light)
  }
  
  private let benefitView = UIView().then {
    $0.backgroundColor = .white
    $0.layer.borderWidth = 0.4
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 2
  }
  private let benefitTitleLabel = UILabel().then {
    $0.text = "방주인 혜택"
    $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
  }
  private let benefitDetailabel1 = UILabel().then {
    $0.text = "- 빈 방을 무제한으로 등록"
    $0.font = UIFont.systemFont(ofSize: 14, weight: .light)
  }
  private let benefitDetailabel2 = UILabel().then {
    $0.text = "- 최대 3곳의 중개사무소가 광고 시작"
    $0.font = UIFont.systemFont(ofSize: 14, weight: .light)
  }
  private let benefitDetailabel3 = UILabel().then {
    $0.text = "- 효율적인 공실관리"
    $0.font = UIFont.systemFont(ofSize: 14, weight: .light)
  }
  private let serviceButton = UIButton().then {
    $0.setImage(UIImage(named: "serviceButtonLogo"), for: .normal)
  }
  private let phoneLogoImage = UIImageView().then {
    $0.image = UIImage(named: "phoneLogo")
  }
  private let regulationLabel = UIButton().then {
    $0.setTitle("매물관리규정", for: .normal)
    $0.setTitleColor(UIColor(named: "regulationColor"), for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
  }
  let bottomCallNumLabel = UILabel().then {
    $0.text = "고객센터 02-1899-6840"
    $0.textColor = .gray
    $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
  }
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = UIColor(named: "roomGuideBottomColor")
    setupUI()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    // MARK: -action
  
  // 서비스버튼 클릭시 앱스토어 다방으로 연결 (다방주소몰라서 패캠밥집임)
  @objc private func didTapServiceButton(_ sender: UIButton) {
    if let url = URL(string: "itms-apps://itunes.apple.com/app/1492220578") {
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    
    contentView.addSubviews([
      dabangLogoImage,
      explanationLabel1,
      explanationLabel2,
      benefitView,
      serviceButton,
      phoneLogoImage,
      regulationLabel,
      bottomCallNumLabel,
    ])
    benefitView.addSubviews([
      benefitTitleLabel,
      benefitDetailabel1,
      benefitDetailabel2,
      benefitDetailabel3,
    ])

    setupConstraint()
    
    serviceButton.addTarget(self, action: #selector(didTapServiceButton(_:)), for: .touchUpInside)
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    dabangLogoImage.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(contentView.snp.top).offset(40)
    }
    explanationLabel1.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(dabangLogoImage.snp.bottom).offset(12)
    }
    explanationLabel2.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(explanationLabel1.snp.bottom).offset(6)
    }
    benefitView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(explanationLabel2.snp.bottom).offset(14)
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.25)
    }
    benefitTitleLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(18)
      $0.top.equalToSuperview().offset(16)
    }
    benefitDetailabel1.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(12)
      $0.top.equalTo(benefitTitleLabel.snp.bottom).offset(10)
    }
    benefitDetailabel2.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(12)
      $0.top.equalTo(benefitDetailabel1.snp.bottom).offset(6)
    }
    benefitDetailabel3.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(12)
      $0.top.equalTo(benefitDetailabel2.snp.bottom).offset(6)
      $0.bottom.equalTo(benefitView.snp.bottom).offset(-12)
    }
    serviceButton.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(benefitView.snp.bottom).offset(28)
    }
    
    phoneLogoImage.snp.makeConstraints {
      $0.leading.equalTo(serviceButton.snp.trailing).offset(6)
      $0.top.equalTo(benefitView.snp.bottom).offset(28)
    }
    
    regulationLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalTo(contentView.snp.bottom).offset(-44)
    }
    bottomCallNumLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(regulationLabel.snp.bottom).offset(6)
    }
  }
}
