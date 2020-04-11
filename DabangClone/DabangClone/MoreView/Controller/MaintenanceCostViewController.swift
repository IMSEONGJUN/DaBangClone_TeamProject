//
//  MaintenanceCostViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 방내놓기 - 기본정보 - 관리비
class MaintenanceCostViewController: UIViewController {

  // MARK: -Property
  let tableView = UITableView().then {
    $0.allowsSelection = false
//    $0.separatorStyle = .none
  }
  let category = ["전기세", "수도세", "인터넷", "청소비", "도시가스", "유선TV", "기타"]
  // MARK: -Lift cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: -Action
  
  
  // MARK: -setupUI
  private func setupUI() {
    view.addSubview(tableView)
    
    tableView.register(MCTopTableViewCell.self, forCellReuseIdentifier: MCTopTableViewCell.identifier)
    tableView.register(MCBottomTableViewCell.self, forCellReuseIdentifier: MCBottomTableViewCell.identifier)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
//    tableView.delegate = self
    tableView.backgroundColor = UIColor(named: "TextFieldColor")
    
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    
    tableView.snp.makeConstraints {
      
      $0.top.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.leading.equalToSuperview()
      $0.trailing.equalToSuperview()
    }
  }

}

// MARK: -UITableViewDataSource

extension MaintenanceCostViewController: UITableViewDataSource {
//  func numberOfSections(in tableView: UITableView) -> Int {
//    2
//  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return category.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    switch indexPath.row {
//    case 0:
//      let cell = tableView.dequeueReusableCell(withIdentifier: MCTopTableViewCell.identifier, for: indexPath) as! MCTopTableViewCell
//      return cell
//    case 1:
//      let cell = tableView.dequeueReusableCell(withIdentifier: MCBottomTableViewCell.identifier , for: indexPath) as! MCBottomTableViewCell
//      return cell
//    default:
//      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//      return cell
//    }
    
    let cell = tableView.dequeueReusableCell(withIdentifier: MCBottomTableViewCell.identifier , for: indexPath) as! MCBottomTableViewCell
    cell.configue(category: category[indexPath.row])
    return cell
  }
  
}
