//
//  AddRoomView.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/27.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import Then
import SnapKit
class AddRoomView: UIView {
  

  // MARK: - Property
  private let potoView = UIImageView().then {
    $0.backgroundColor = .red
  }
  private let layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal

  }
//    .then {
//    $0.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
//    $0.minimumInteritemSpacing = 0
//    $0.minimumLineSpacing = 0
//    $0.itemSize = CGSize(width: 150, height: 150)
    // 헤더값 주기
//    $0.headerReferenceSize = CGSize(width: 60, height: 60)
//    $0.sectionHeadersPinToVisibleBounds = true
//    $0.footerReferenceSize = CGSize(width: 50, height: 50)
//  }
  private lazy var potoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.dataSource = self
    $0.delegate = self
    $0.backgroundColor = .red
    $0.isPagingEnabled = true
//    $0.alwaysBounceHorizontal = false
//    $0.scrollsToTop = false
    $0.bounces = false
    $0.register(AddRoomCollectionViewCell.self, forCellWithReuseIdentifier: AddRoomCollectionViewCell.identifier)
  }
  private let addressView = AddRoomTitleView().then {
    $0.configure(title: "주소", Image: "addressIcon")
  }
  private let BasicInfomationView = AddRoomTitleView().then {
    $0.configure(title: "기본 정보", Image: "addressIcon")
  }
  private let additionalView = AddRoomTitleView().then {
    $0.configure(title: "추가 정보", Image: "addressIcon")
  }
  private let explanationView = AddRoomTitleView().then {
    $0.configure(title: "설명", Image: "addressIcon")
  }
  private let completionButton = UIButton().then {
    $0.setTitle("방 내놓기 완료", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.addTarget(self, action: #selector(didTapCompletionButton(_:)), for: .touchUpInside)
    $0.backgroundColor = .blue
  }
  private let linViews: [UIView] = [
    UIView().then({
    $0.backgroundColor = UIColor(named: "AlertColor")
  }),
    UIView().then({
    $0.backgroundColor = UIColor(named: "AlertColor")
  }),
    UIView().then({
    $0.backgroundColor = UIColor(named: "AlertColor")
  }),
    UIView().then({
    $0.backgroundColor = UIColor(named: "AlertColor")
  }),
  ]


  

  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = #colorLiteral(red: 0.9528682828, green: 0.9529824853, blue: 0.9528294206, alpha: 1)
    setupUI()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Action
  @objc private func didTapCompletionButton(_ sender: UIButton) {
    
  }
  // MARK: - SetupUI
  private func setupUI() {
    self.addSubviews([potoView, addressView, BasicInfomationView, additionalView, explanationView, completionButton, potoCollectionView])
    self.linViews.forEach {
      self.addSubview($0)
    }
    setupConstraints()
  }
  
  // MARK: - Layout
  private func setupConstraints() {
//    potoView.snp.makeConstraints {
//      $0.top.leading.trailing.equalToSuperview()
//      $0.height.equalTo(self.snp.height).multipliedBy(0.4)
//    }
    potoCollectionView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(self.snp.height).multipliedBy(0.4)
    }
    addressView.snp.makeConstraints {
      $0.top.equalTo(potoCollectionView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(self.snp.height).multipliedBy(0.08)
    }
    linViews[0].snp.makeConstraints {
      $0.leading.equalToSuperview().offset(8)
      $0.trailing.equalToSuperview().offset(-8)
      $0.height.equalTo(1)
      $0.top.equalTo(addressView.snp.bottom)
    }
    BasicInfomationView.snp.makeConstraints {
      $0.top.equalTo(linViews[0].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(self.snp.height).multipliedBy(0.08)
    }
    linViews[1].snp.makeConstraints {
      $0.leading.equalToSuperview().offset(8)
      $0.trailing.equalToSuperview().offset(-8)
      $0.height.equalTo(1)
      $0.top.equalTo(BasicInfomationView.snp.bottom)
    }
    additionalView.snp.makeConstraints {
      $0.top.equalTo(linViews[1].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(self.snp.height).multipliedBy(0.08)
    }
    linViews[2].snp.makeConstraints {
      $0.leading.equalToSuperview().offset(8)
      $0.trailing.equalToSuperview().offset(-8)
      $0.height.equalTo(1)
      $0.top.equalTo(additionalView.snp.bottom)
    }
    explanationView.snp.makeConstraints {
      $0.top.equalTo(linViews[2].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(self.snp.height).multipliedBy(0.08)
    }
    linViews[3].snp.makeConstraints {
      $0.leading.equalToSuperview().offset(8)
      $0.trailing.equalToSuperview().offset(-8)
      $0.height.equalTo(1)
      $0.top.equalTo(explanationView.snp.bottom)
    }
    completionButton.snp.makeConstraints {
      $0.leading.bottom.trailing.equalToSuperview()
      $0.height.equalTo(self.snp.height).multipliedBy(0.1)
    }
  }
}


extension AddRoomView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    8
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    var color: UIColor = .gray
    if indexPath.row % 2 == 1 {
      color = .blue
    }
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddRoomCollectionViewCell.identifier, for: indexPath) as! AddRoomCollectionViewCell
    cell.backgroundColor = color
    
    return cell
  }
}

extension AddRoomView: UICollectionViewDelegateFlowLayout {
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.frame.width, height: self.frame.height * 0.4)
  }
  // 위아래 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  // 좌우 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  
  // 전체 top, left, bottom, right 마진
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let margin: CGFloat = 0
    return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
  }
}
