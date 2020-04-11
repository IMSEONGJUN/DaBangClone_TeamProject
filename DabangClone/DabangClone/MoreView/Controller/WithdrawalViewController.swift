//
//  WithdrawalViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/27.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

//회원탈퇴 뷰
class WithdrawalViewController: UIViewController {

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
    tableView.register(WTopTableViewCell.self, forCellReuseIdentifier: WTopTableViewCell.identifier)
    tableView.register(WBottomTableViewCell.self, forCellReuseIdentifier: WBottomTableViewCell.identifier)
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

extension WithdrawalViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: WTopTableViewCell.identifier, for: indexPath) as! WTopTableViewCell
      cell.delegate = self
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: WBottomTableViewCell.identifier, for: indexPath)
      return cell
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      return cell
    }
  }

}

//extension WithdrawalViewController: WTopTableViewCelldelegate {
//
//  func didTapreasonButton() {
//     //알림창을 정의("로그아웃 하시겠습니까 타이틀 폰트싸이즈를 못줄임..)
//       let alert = UIAlertController(title: "로그아웃 하시겠습니까?", message: nil, preferredStyle: .alert)
//
//       let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
//       let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
//
//       alert.addAction(cancelAction)
//       alert.addAction(okAction)
//
//       //알림창 화면에 표시
//       self.present(alert, animated: false)
//
//
//  }
//
//
//
//}
extension WithdrawalViewController: WTopTableViewCelldelegate {
  func didTapReasonButton() {
    print("눌림?")
    let alert = UIAlertController(title: "로그아웃 하시겠습니까?", message: nil, preferredStyle: .alert)
    
           let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
           let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
    
           alert.addAction(cancelAction)
           alert.addAction(okAction)
    
           //알림창 화면에 표시
           self.present(alert, animated: false)
  }
  
  
}

// MARK: -UITableViewDelegate

extension WithdrawalViewController: UITableViewDelegate {
//  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    let mainheight = UIScreen.main.bounds.height
//    switch indexPath.row {
//    case 0:
//      return mainheight * 0.8
//    case 1:
//      return mainheight * 0.3
//    default:
//      return 0
//    }

//  }
}
