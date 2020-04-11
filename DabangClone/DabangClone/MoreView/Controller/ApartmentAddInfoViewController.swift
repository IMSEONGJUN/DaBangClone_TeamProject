//
//  ApartmentAddInfoViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/02.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class ApartmentAddInfoViewController: UIViewController {
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
      
      
      tableView.register(AddTitleTableViewCell.self, forCellReuseIdentifier: AddTitleTableViewCell.identifier)
      tableView.register(InputCell.self, forCellReuseIdentifier: InputCell.identifier)
      tableView.register(AbleSegmentCell.self, forCellReuseIdentifier: AbleSegmentCell.identifier)
      tableView.register(IsThereCell.self, forCellReuseIdentifier: IsThereCell.identifier)
      tableView.register(ThreeSegmentTableViewCell.self, forCellReuseIdentifier: ThreeSegmentTableViewCell.identifier)
      tableView.register(CheckBoxCell.self, forCellReuseIdentifier: CheckBoxCell.identifier)
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

  extension ApartmentAddInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      var cell: UITableViewCell!
      switch indexPath.row {
      case 0:
        cell = setAddtionalTableViewCell(tableView: tableView, indexPath: indexPath, CellType: .Title)
      case 1:
        cell = setAddtionalTableViewCell(tableView: tableView, indexPath: indexPath, title: AdditionalInfo.옵션, CellType: .IsThere)
      case 2:
        cell = setAddtionalTableViewCell(tableView: tableView, indexPath: indexPath, title: AdditionalInfo.난방종류, CellType: .ThreeSegment)
      case 3:
        cell = setAddtionalTableViewCell(tableView: tableView, indexPath: indexPath, title: AdditionalInfo.반려동물, CellType: .AbleSegment)
      case 4:
        cell = setAddtionalTableViewCell(tableView: tableView, indexPath: indexPath, title: AdditionalInfo.전세자금대출, CellType: .AbleSegment)
      case 5:
        cell = setAddtionalTableViewCell(tableView: tableView, indexPath: indexPath, title: AdditionalInfo.준공년도, CellType: .Input)
      default:
        break
      }
      return cell
    }
  }

  extension ApartmentAddInfoViewController: UITableViewDelegate {
    
  }
