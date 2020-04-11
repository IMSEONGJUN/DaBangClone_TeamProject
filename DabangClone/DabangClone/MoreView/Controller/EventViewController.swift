//
//  EventViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/29.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

//MARK: - Model

struct EventModel {
  let title: String
  let isDone: Bool
  let date: String
  let dDay: Int
  let imageURL: String
  let needCheck: Bool
}

//Test Model
let eventModel: [EventModel] = [
  EventModel(title: "[이벤트] 다방X알바천국 오천만알바", isDone: false, date: "2020.03.03 ~ 2020.03.22", dDay: -5, imageURL: "event0", needCheck: true),
  EventModel(title: "[이벤트] 월세드림 기간 연장", isDone: true, date: "2020.03.01 ~ 2020.03.09", dDay: 0, imageURL: "event1", needCheck: true),
  EventModel(title: "[이벤트] 다방 TV-CF 온에어 이벤트 '다방...", isDone: true, date: "2019.12.27 ~ 2020.01.20", dDay: 0, imageURL: "event2", needCheck: true),
  EventModel(title: "[이벤트] 인생방 프로젝트 2탄 결과", isDone: true, date: "2019.11.15 ~ 2019.11.29", dDay: 0, imageURL: "event3", needCheck: false),
  EventModel(title: "[이벤트]다방X비비고 자취세끼", isDone: true, date: "2019.11.01 ~ 2019.11.13", dDay: 0, imageURL: "event4", needCheck: true),
]

class EventViewController: UIViewController {
  
  //MARK: - Property
  let tableView = UITableView().then {
    $0.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.identifier)
  }
  
  //MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    DispatchQueue.main.async {
      self.setupUI()
    }
  }
  
  override func viewSafeAreaInsetsDidChange() {
    super.viewSafeAreaInsetsDidChange()
  }
  
  //MARK: - Setup UI
  
  private func setupUI() {
    
    tableView.rowHeight = 220
    
    view.addSubviews([tableView])
    setupContstraints()
  }
  
  private func setupContstraints() {
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  //MARK: - Action
  
}

extension EventViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    eventModel.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.identifier, for: indexPath) as! EventTableViewCell
    cell.configure(model: eventModel[indexPath.row])
    cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    return cell
  }
}

extension EventViewController: UITableViewDelegate {
  
}
