//
//  PersonalModifyViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/25.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 개인정보변경 뷰
class PersonalModifyViewController: UIViewController {
  
  // MARK: -Property
  let tableView = UITableView().then {
    $0.allowsSelection = false
    $0.separatorStyle = .none
  }
  
  // MARK: -Lift cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: -Action
  
  
  // MARK: -setupUI
  private func setupUI() {
    
    tableView.register(PMTopTableViewCell.self, forCellReuseIdentifier: PMTopTableViewCell.identifier)
    tableView.register(PMBodyTableViewCell.self, forCellReuseIdentifier: PMBodyTableViewCell.identifier)
    tableView.register(PMBottomTableViewCell.self, forCellReuseIdentifier: PMBottomTableViewCell.identifier)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
    tableView.delegate = self
    tableView.backgroundColor = UIColor(named: "TextFieldColor")
    
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    view.addSubview(tableView)
    
    tableView.snp.makeConstraints {
      
      $0.top.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.leading.equalToSuperview()
      $0.trailing.equalToSuperview()
    }
  }
  
}



// MARK: -UITableViewDataSource

extension PersonalModifyViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: PMTopTableViewCell.identifier, for: indexPath) as! PMTopTableViewCell
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: PMBodyTableViewCell.identifier , for: indexPath) as! PMBodyTableViewCell
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: PMBottomTableViewCell.identifier , for: indexPath) as! PMBottomTableViewCell
      cell.delegate = self
      return cell
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      return cell
    }
  }
  
}

// MARK: -UITableViewDelegate

extension PersonalModifyViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let mainwidth = UIScreen.main.bounds.width
    switch indexPath.row {
    case 0:
      return mainwidth * 0.4
    case 1:
      return mainwidth * 0.65
    case 2:
      return mainwidth * 0.6
    default:
      return 0
    }
    
  }
}


extension PersonalModifyViewController: PMBottomTableViewCelldelegate {
  
  func didTapSignOutButton() {
    //알림창을 정의("로그아웃 하시겠습니까 타이틀 폰트싸이즈를 못줄임..)
    let alert = UIAlertController(title: "로그아웃 하시겠습니까?", message: nil, preferredStyle: .alert)
    
    let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
    let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
    
    alert.addAction(cancelAction)
    alert.addAction(okAction)

    //알림창 화면에 표시
    self.present(alert, animated: false)

  }
}
