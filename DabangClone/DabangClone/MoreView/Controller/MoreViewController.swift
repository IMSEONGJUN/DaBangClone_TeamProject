//
//  MoreViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/23.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

enum MoreViewButtons {
  case 방내놓기
  case 알림
  case 자주묻는질문
}

class MoreViewController: UIViewController {
  
  //MARK: - 프로퍼티
  let userName = "PandaMan"
  let userEmail = "user@user.com"
  
  
  
  
  //MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    let moreView = MoreView(frame: view.safeAreaLayoutGuide.layoutFrame)
    moreView.delegate = self
    view.backgroundColor = .white
    //      navigationController?.pushViewController(LoginViewController(), animated: true)
    
    setupUI(vc: moreView)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.isHidden = true
  }
  
  //MARK: - SetupUI & Constraints
  private func setupUI(vc: UIView) {
    
    view.addSubview(vc)
    setupConstraints()
  }
  
  private func setupConstraints() {
    
  }
  
  func presentView(_ sender: MoreViewButtons) {
    
    switch sender {
    case .방내놓기:
      print("잘왔음")
      let vc = RoomGuideViewController()
      vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)
    case .알림:
      let vc = NoticeViewController()
      vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)
    case .자주묻는질문:
      print("Go to 자주묻는질문")
      let vc = FrequentlyViewController()
      vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)
    default:
      break
    }
    
  }
  
}

extension MoreViewController: MoreViewDelegate {
  func didTapSellMyRoomButton(_ sender: MoreViewButtons) {
    presentView(sender)
  }
  
  
}
