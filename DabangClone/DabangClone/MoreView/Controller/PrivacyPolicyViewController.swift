//
//  PrivacyPolicyViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/25.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import WebKit
import SnapKit
class PrivacyPolicyViewController: UIViewController {
  
  var webView = WKWebView().then {
    let myURL = URL(string: "https://pro.dabangapp.com/#/agree-view?seq=4")
    let myRequest = URLRequest(url: myURL!)
    $0.load(myRequest)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "개인정보처리방침"
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .plain, target: self, action: #selector(didTapBackButton(_:)))
    self.navigationItem.leftBarButtonItem?.tintColor = .black
    setupUI()
  }
  
  
  // MARK: -Action
  @objc private func didTapBackButton(_ sender: UIButton) {
    self.dismiss(animated: true)
  }
  // MARK: -setupUI
  private func setupUI() {
    webView.uiDelegate = self
    self.view.addSubview(webView)
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  private func setupConstraint() {
    webView.snp.makeConstraints {
      $0.top.bottom.leading.trailing.equalToSuperview()
    }
  }
}
extension PrivacyPolicyViewController: WKUIDelegate {
}
