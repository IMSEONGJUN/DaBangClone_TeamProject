//
//  BaseInfoViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class BaseInfoViewController: UIViewController {
  
  let infoView = BaseInfoView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    notificationReserve()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    setupUI()
  }
  
  private func setupUI() {
    view.addSubview(infoView)
    setupConstraints()
  }
  
  private func setupConstraints() {
    infoView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }
  
  //MARK: - Actions
  
  private func notificationReserve() {
    NotificationCenter.default.addObserver(self, selector: #selector(didTapEnableButton), name: NSNotification.Name(rawValue: "Enable"), object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(didTapEnableButton), name: NSNotification.Name(rawValue: "Input"), object: nil)
  }
  
  
  @objc private func didTapInputButton(_ notification: Notification) {
    if let buttontitle = notification.userInfo as Dictionary? {
      if let title = buttontitle["buttonTitle"] as? String {
        print(title)
      }
    }
  }
  
  @objc private func didTapEnableButton(_ notification: Notification) {
    if let buttontitle = notification.userInfo as Dictionary? {
      if let title = buttontitle["buttonTitle"] as? String {
        print(title)
      }
    }
  }
  
  @objc private func didTapParkingEnableButton() {
    print("주차")
  }
}
