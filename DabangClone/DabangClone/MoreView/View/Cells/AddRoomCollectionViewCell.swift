//
//  AddRoomCollectionViewCell.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/27.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class AddRoomCollectionViewCell: UICollectionViewCell {
   
  // MARK: -Identifier
    static let identifier = "AddRoomCollectionViewCell"
  //MARK: - Property

  private let imageView = UIImageView()
  // MARK: -init
    override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .white
      setupUI()
    }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    self.addSubviews([imageView])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    imageView.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalToSuperview()
    }
  }
}
