//
//  CompareTableView1.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/09.
//  Copyright © 2020 pandaman. All rights reserved.
//

//import UIKit
//
//class CompareTableView: UITableViewController {
//    
//    var dataSource = [RoomInfo]()
//    
//    var observer: ((CGFloat) ->())?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setTableView()
//        setCompareViewModel()
//    }
//    
//    private func setTableView() {
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 200
//        tableView.showsVerticalScrollIndicator = false
//        tableView.allowsSelection = false
//        tableView.register(CompareCell.self, forCellReuseIdentifier: CompareCell.identifier)
//    }
//    
//    func setCompareViewModel() {
//        observer = { [weak self] yOffset in
//            self?.tableView.contentOffset.y = yOffset
//            self?.view.layoutIfNeeded()
//        }
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = CompareCell(style: .default, reuseIdentifier: nil)
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = CompareTableViewHeader(roomID: "1234567", image: UIImage(named: "dabangProImage")!, roomStyle: "월세", cost: "5억/150")
//        return header
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 190
//    }
//    
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footer = UIButton()
//        footer.backgroundColor = #colorLiteral(red: 0.2596234679, green: 0.5155771971, blue: 0.9926976562, alpha: 1)
//        footer.setTitle("문의하기", for: .normal)
//        footer.setTitleColor(.white, for: .normal)
//        footer.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
//        return footer
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 80
//    }
//    
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        CompareScrollManager.shared.scrollYOffset = tableView.contentOffset.y
//    }
//}
