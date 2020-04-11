//
//  NoticeEmptyView.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import Then
import SnapKit
class NoticeEmptyView: UIView {
  //  static let nibView: EmptyView = EmptyView()
    
    private let label = UILabel().then {
      $0.text = "새로운 알림이 없습니다"
  //    $0.font = UIFont.preferredFont(forTextStyle: .largeTitle)
      $0.textColor = #colorLiteral(red: 0.5764250159, green: 0.5764964819, blue: 0.576400578, alpha: 1)
      $0.numberOfLines = 0
      $0.adjustsFontForContentSizeCategory = true
      $0.textAlignment = .center
    }
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupUI()
      backgroundColor = #colorLiteral(red: 0.9528682828, green: 0.9529824853, blue: 0.9528294206, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
      self.addSubview(label)
      setupConstraints()
    }
    
    private func setupConstraints() {
      label.snp.makeConstraints{
        $0.center.equalToSuperview()
      }
    }
  }
