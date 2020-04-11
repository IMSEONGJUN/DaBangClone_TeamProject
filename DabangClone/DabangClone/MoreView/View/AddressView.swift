////
////  AddressView.swift
////  DabangClone
////
////  Created by 황정덕 on 2020/03/30.
////  Copyright © 2020 pandaman. All rights reserved.
////
//
//import UIKit
//import Then
//import SnapKit
//import MapKit
//import GoogleMaps
//class AddressView: UIView {
//  // MARK: - Identifier
//  // MARK: - Property
//  private let topLabel = UILabel().then {
//    $0.text = "주소는 동, 면, 읍까지만 노출됩니다."
//  }
//  private let addressButton = UIButton().then {
//    $0.setTitle("주소 찾기", for: .normal)
//    $0.setTitleColor(.black, for: .normal)
//    $0.layer.borderWidth = 0.6
//    $0.layer.borderColor = UIColor.lightGray.cgColor
//    $0.layer.cornerRadius = 4
//    $0.addTarget(self, action: #selector(didTapSearchButton(_:)), for: .touchUpInside)
//  }
//  private let roadAddressImageView = UIImageView().then {
//    $0.image = UIImage(named: "roadAddressIcon")
//  }
//  private let roadAddressLabel = UILabel().then {
//    $0.text = "경기도 김포시 사우로 1"
//  }
//  private let addressImageView = UIImageView().then {
//    $0.image = UIImage(named: "numberIcon")
//  }
//  private let addressLabel = UILabel().then {
//    $0.text = "경기도 김포시 사우동 889"
//  }
//
//  private let mapView = GMSMapView().then {
//    $0.camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
//  }
//
//
//  private let addressDetailTextField = UITextField().then {
//    $0.placeholder = "동, 호수 등 상세주소 입력"
//    $0.layer.borderWidth = 0.6
//    $0.layer.borderColor = UIColor.lightGray.cgColor
//    $0.layer.cornerRadius = 4
//    $0.addLeftPadding(20)
//  }
//  private let buttonLabel = UILabel().then {
//    $0.text = "고시원, 고시텔 등 고시원업 매물은 올릴 수 없으며 등록 시 비공개 처리됩니다."
//  }
//
//  // MARK: - Init
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    setupUI()
//  }
//
//  required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//  // MARK: - Action
//  @objc private func didTapSearchButton(_ sender: UIButton) {
//    print("didTapSearchButton")
//  }
//  // MARK: - Action
//  // MARK: - SetupUI
//  private func setupUI() {
//    self.addSubviews([topLabel,addressButton,roadAddressImageView,roadAddressLabel,addressImageView,addressLabel,addressDetailTextField,buttonLabel,mapView])
//    setupConstraint()
//  }
//
//  // MARK: - Layout
//  private func setupConstraint() {
//    topLabel.snp.makeConstraints {
//      $0.centerX.equalToSuperview()
//      $0.top.equalToSuperview().offset(8)
//    }
//    addressButton.snp.makeConstraints {
//      $0.top.equalTo(topLabel.snp.bottom).offset(8)
//      $0.centerX.equalToSuperview()
//      $0.width.equalToSuperview().multipliedBy(0.9)
//      $0.height.equalTo(50)
//    }
//    roadAddressImageView.snp.makeConstraints {
//      $0.top.equalTo(addressButton.snp.bottom).offset(8)
//      $0.leading.equalTo(addressButton.snp.leading)
//      $0.height.equalTo(roadAddressLabel.snp.height).multipliedBy(1.2)
//      $0.width.equalTo(self.snp.width).multipliedBy(0.1)
//    }
//    roadAddressLabel.snp.makeConstraints {
//      $0.leading.equalTo(roadAddressImageView.snp.trailing).offset(8)
//      $0.centerY.equalTo(roadAddressImageView.snp.centerY)
//    }
//    addressImageView.snp.makeConstraints {
//      $0.top.equalTo(roadAddressImageView.snp.bottom).offset(8)
//      $0.leading.equalTo(addressButton.snp.leading)
//      $0.height.equalTo(addressLabel.snp.height).multipliedBy(1.2)
//      $0.width.equalTo(self.snp.width).multipliedBy(0.1)
//    }
//    addressLabel.snp.makeConstraints {
//      $0.leading.equalTo(addressImageView.snp.trailing).offset(8)
//      $0.centerY.equalTo(addressImageView.snp.centerY)
//    }
//    addressDetailTextField.snp.makeConstraints {
//      $0.top.equalTo(addressImageView.snp.bottom).offset(8)
////      $0.leading.equalToSuperview().offset(8)
////      $0.trailing.equalToSuperview().offset(-8)
//      $0.centerX.equalToSuperview()
//      $0.width.equalToSuperview().multipliedBy(0.9)
//      $0.height.equalTo(50)
//    }
//    buttonLabel.snp.makeConstraints {
//      $0.centerX.equalToSuperview()
//      $0.top.equalTo(addressDetailTextField.snp.bottom).offset(8)
//    }
//    mapView.snp.makeConstraints {
//      $0.bottom.leading.trailing.equalToSuperview()
//      $0.top.equalTo(buttonLabel.snp.bottom).offset(8)
//    }
//  }
//
//}
