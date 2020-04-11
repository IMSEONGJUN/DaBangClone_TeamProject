//
//  ExplainViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 방내놓기 - 설명부분
class ExplainViewController: UIViewController {
  
  // MARK: -Property
  let boxView = ExplainView()
  
  // MARK: -Lift cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
  }
  
  // MARK: -Action
  
  
  // MARK: -setupUI
  private func setupUI() {
    view.addSubviews([
      boxView,
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    let guide = view.safeAreaLayoutGuide
    boxView.snp.makeConstraints {
      $0.top.equalTo(guide.snp.top)
      $0.leading.equalTo(guide.snp.leading)
      $0.trailing.equalTo(guide.snp.trailing)
      $0.bottom.equalTo(guide.snp.bottom)
    }
  }
  
}
