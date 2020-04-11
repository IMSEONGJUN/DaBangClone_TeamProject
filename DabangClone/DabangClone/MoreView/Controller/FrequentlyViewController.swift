//
//  FrequentlyViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/25.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FrequentlyViewController: UIViewController {
  
  var questions: [Question] = [
    Question(title: titleArray[0], content: contentArray[0]),
    Question(title: titleArray[1], content: contentArray[1]),
    Question(title: titleArray[2], content: contentArray[2]),
    Question(title: titleArray[3], content: contentArray[3]),
    Question(title: titleArray[4], content: contentArray[4]),
    Question(title: titleArray[5], content: contentArray[5]),
    Question(title: titleArray[6], content: contentArray[6]),
    Question(title: titleArray[7], content: contentArray[7]),
  ]
  
  var tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.isHidden = false
    self.navigationController?.navigationBar.tintColor = .black
    self.navigationController?.navigationBar.barTintColor = .white

    self.title = "자주묻는 질문"
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
//    self.navigationController?.navigationBar.backItem?.title = ""
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.navigationController?.navigationBar.backItem?.title = ""

  }
  
  private func setupUI() {
    tableView.register(FrequentlyTableViewCell.self, forCellReuseIdentifier: FrequentlyTableViewCell.identifier)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.frame = view.safeAreaLayoutGuide.layoutFrame
    tableView.backgroundColor = .white
    tableView.allowsSelection = false
    tableView.separatorStyle = .none
    view.addSubview(tableView)
    setupConstraints()
  }
  
  private func setupConstraints() {
    
  }
  
  @objc private func didTapLeftBarItem() {
    self.navigationController?.popViewController(animated: true)
  }
  
  
}

extension FrequentlyViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return questions.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if !questions[section].open {
      return 0
    } else {
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: FrequentlyTableViewCell.identifier, for: indexPath) as! FrequentlyTableViewCell
    let contents = questions[indexPath.section].content
    cell.contentLabel.text = contents
    
    return cell
  }
  
  
}

extension FrequentlyViewController: UITableViewDelegate {
  
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
    
    sectionTitle.text = questions[section].title
    tableView.addSubview(sectionView)
    sectionView.addSubview(separatorOfHeader)
    sectionView.addSubview(button)
    sectionView.addSubview(sectionTitle)
    
    button.tag = section
    button.addTarget(self, action: #selector(tapSection(_:)), for: .touchUpInside)
    button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
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
    
    if section == 7 {
      sectionView.addSubview(lastSeparator)
      
      lastSeparator.snp.makeConstraints {
        $0.leading.equalTo(sectionTitle)
        $0.trailing.equalTo(button)
        $0.bottom.equalToSuperview().offset(9)
        $0.height.equalTo(1)
      }
    }
    
    return sectionView
  }
  
  @objc private func tapSection(_ sender: UIButton) {
    let section = sender.tag

    let isOpen = questions[section].open
    questions[section].open = !isOpen
    
    tableView.beginUpdates()
    if isOpen {
      tableView.deleteRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
      sender.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    } else {
      sender.setImage(UIImage(systemName: "chevron.up"), for: .normal)
      tableView.insertRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
    }
    tableView.endUpdates()
  }
}
