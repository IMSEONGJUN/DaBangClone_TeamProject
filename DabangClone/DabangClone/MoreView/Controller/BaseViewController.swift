//
//  BaseViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/02.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
  
  //MARK: - Property
  
  let tableView = UITableView().then {
    $0.layer.borderColor = UIColor.gray.cgColor
    $0.layer.borderWidth = 1
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 4
  }
  
  //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white
      
      setupUI()
    }
 
  
  //MARK: - setupUI & SetupConstraints
  
  private func setupUI() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 50
    tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
    tableView.register(InputCell.self, forCellReuseIdentifier: InputCell.identifier)
    tableView.register(AbleSegmentCell.self, forCellReuseIdentifier: AbleSegmentCell.identifier)
    tableView.register(IsThereCell.self, forCellReuseIdentifier: IsThereCell.identifier)
    tableView.register(ThreeSegmentTableViewCell.self, forCellReuseIdentifier: ThreeSegmentTableViewCell.identifier)
    view.addSubview(tableView)
  
    setupConstraints()
  }
  
  private func setupConstraints() {
    tableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 100, left: 20, bottom: 20, right: 20))
    }
  }
  
  
  //MARK: - Action
  
  

}

extension BaseViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 8
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: UITableViewCell!
    switch indexPath.row {
    case 0:
      cell = setTableViewCell(tableView: tableView, indexPath: indexPath, CellType: .Title)
    case 1:
      cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.가격, CellType: .Input)
    case 2:
      cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.층수, CellType: .Input)
    case 3:
      cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.방크기, CellType: .Input)
    case 4:
      cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.단기임대, CellType: .AbleSegment)
    case 5:
      cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.관리비, CellType: .IsThere)
    case 6:
      cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.주차, CellType: .AbleSegment)
    case 7:
      cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.입주가능일, CellType: .ThreeSegment)
    default:
      break
    }
    return cell
  }
}

extension BaseViewController: UITableViewDelegate {
  
}
