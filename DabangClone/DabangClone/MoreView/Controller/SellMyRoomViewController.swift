//
//  SellMyRoomViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/26.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class SellMyRoomViewController: UIViewController {
  
  var roomMenus = [
    RoomMenu(title: "원룸(주택/빌라)", menus: ["단독주택", "다가구주택", "빌라/연립/다세대", "상가주택"]),
    RoomMenu(title: "투룸(주택/빌라)", menus: ["단독주택", "다가구주택", "빌라/연립/다세대", "상가주택"]),
    RoomMenu(title: "쓰리룸(주택/빌라)", menus: ["단독주택", "다가구주택", "빌라/연립/다세대", "상가주택"]),
    RoomMenu(title: "오피스텔", menus: ["오피스텔", "도시형 생활주택"]),
    RoomMenu(title: "아파트", menus: nil)
  ]
  
  //MARK: - Property
  let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
  
  //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

      
      setupUI()
    }
  
  private func setupUI() {
    
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(SellMyRoomTableViewCell.self, forCellReuseIdentifier: SellMyRoomTableViewCell.identifier)
    tableView.isScrollEnabled = false
    
    view.addSubview(tableView)
    setupContstraints()
  }
  
  private func setupContstraints() {
    tableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
    }
  }
  //MARK: - Action
    
}

extension SellMyRoomViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if !roomMenus[section].open {
      return 0
    } else {
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: SellMyRoomTableViewCell.identifier, for: indexPath) as! SellMyRoomTableViewCell
    cell.backgroundColor = UIColor(named: "questionBGColor")
    
    let roomMenu = roomMenus[indexPath.section]
    cell.choiceNum = (roomMenu.menus?.count ?? 0)
    print(cell.choiceNum)
    
    switch cell.choiceNum {
    case 2:
      tableView.rowHeight = 60
      cell.choiceLabelZero.text = roomMenu.menus?[cell.choiceLabelZero.tag]
      
      cell.choiceLabelOne.text = roomMenu.menus?[cell.choiceLabelOne.tag]
    case 4:
      tableView.rowHeight = 120
      cell.choiceLabelZero.text = roomMenu.menus?[cell.choiceLabelZero.tag]
         
         cell.choiceLabelOne.text = roomMenu.menus?[cell.choiceLabelOne.tag]
         
         cell.choiceLabelTwo.text = roomMenu.menus?[cell.choiceLabelTwo.tag]
         
         cell.choiceLabelThree.text = roomMenu.menus?[cell.choiceLabelThree.tag]
    default:
      break
    }
    
    cell.setupUI()
    
    return cell
  }
  
}

extension SellMyRoomViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let sectionView = UIView()
    let button = UIButton(type: .system)
    let sectionTitle = UILabel()
    let separatorOfHeader = UIView().then {
      $0.backgroundColor = UIColor(named: "bezelColor")
    }
    let lastSeparator = UIView().then {
      $0.backgroundColor = UIColor(named: "bezelColor")
    }
    
    sectionTitle.text = roomMenus[section].title
    tableView.addSubview(sectionView)
    sectionView.addSubviews([separatorOfHeader, button, sectionTitle])
    
    button.tag = section
    button.addTarget(self, action: #selector(tapSection(_:)), for: .touchUpInside)
    button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    if roomMenus[section].open {
      button.setImage(UIImage(systemName: "chevron.up"), for: .normal)
    }
    button.tintColor = .black
    tableView.addSubview(sectionView)
    tableView.sectionHeaderHeight = 40
    
    button.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.trailing.equalToSuperview().offset(-10)
      $0.width.height.equalTo(30)
    }
    sectionTitle.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.leading.equalToSuperview().offset(10)
    }
    separatorOfHeader.snp.makeConstraints {
      $0.leading.equalTo(sectionTitle)
      $0.trailing.equalTo(button)
      $0.top.equalToSuperview().offset(-10)
      $0.height.equalTo(1)
    }
    
    return sectionView
  }
  
  @objc private func tapSection(_ sender: UIButton) {
    let section = sender.tag

    
    let isOpen = roomMenus[section].open
    roomMenus[section].open = !isOpen
    
    tableView.beginUpdates()
    if isOpen {
      tableView.deleteRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
      sender.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    } else {
      let otherSection = [0,1,2,3,4]
        .filter { $0 != section }
        .filter { roomMenus[$0].open == true }
        .forEach {
          let isOpen = roomMenus[$0].open
          roomMenus[$0].open = !isOpen
          tableView.reloadData()
          tableView.deleteRows(at: [IndexPath(row: 0, section: $0)], with: .automatic)
      }
      sender.setImage(UIImage(systemName: "chevron.up"), for: .normal)
      tableView.insertRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
      
    }
    tableView.endUpdates()
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
  }
}

