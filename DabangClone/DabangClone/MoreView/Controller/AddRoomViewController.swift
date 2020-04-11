//
//  AddRoomViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/27.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit
class AddRoomViewController: UIViewController {
  
  
  // MARK: -Property
  private let addRoomView = AddRoomView()
  
  // MARK: -Lift cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "duck"
    setupUI()
  }
  
  
//  override func viewSafeAreaInsetsDidChange() {
//    super.viewSafeAreaInsetsDidChange()
//    
//  }
  // MARK: -Action
  
  // MARK: -setupUI
  private func setupUI() {
    self.view.addSubview(addRoomView)
    setupConstraint()
  }
  // MARK: -setupConstraint
  private func setupConstraint() {
    let guide = self.view.safeAreaLayoutGuide
    addRoomView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalTo(guide)
    }
  }
  
}
