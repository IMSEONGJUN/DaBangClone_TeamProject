//
//  CompareController.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/08.
//  Copyright © 2020 pandaman. All rights reserved.
//
//
//import UIKit
//
//class CompareController: UIViewController {
//
//    let noticeView = UIView()
//    let noticeLabel = UILabel()
//
//    var roomsToCompare: [IndexPath : RoomInfo]!
//
//    let scrollView = UIScrollView()
//    let tableView = CompareTableView()
//    let tableView2 = CompareTableView()
//    let tableView3 = CompareTableView()
//
//    let container1 = UIView()
//    let container2 = UIView()
//    let container3 = UIView()
//
//    let tableViewSeparator = UIView()
//    let tableViewSeparator2 = UIView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "비교하기"
//        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(didTapCloseButton))
//        navigationItem.leftBarButtonItem = leftBarButton
//        navigationController?.navigationBar.tintColor = .black
//        view.backgroundColor = .white
//        configureNoticePart()
//        configureScrollView()
//        configureTableView()
//        configureSeparator()
//    }
//
//    @objc func didTapCloseButton() {
//        dismiss(animated: true)
//    }
//
//    private func configureNoticePart() {
//        view.addSubview(noticeView)
//        noticeView.addSubview(noticeLabel)
//        noticeView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        noticeLabel.textColor = .lightGray
//        noticeLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        noticeLabel.text = "3개의 방을 비교한 후, 원하는 방을 문의하세요."
//
//        noticeView.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(40)
//        }
//        noticeLabel.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(20)
//            $0.centerY.equalToSuperview()
//        }
//    }
//
//    private func configureScrollView() {
//        view.addSubview(scrollView)
//        scrollView.addSubviews([container1,container2,container3])
//
//        scrollView.snp.makeConstraints {
//            $0.top.equalTo(noticeView.snp.bottom)
//            $0.leading.trailing.bottom.equalToSuperview()
//        }
//
//        container1.snp.makeConstraints {
//            $0.top.leading.bottom.equalToSuperview()
//            $0.height.equalToSuperview()
//            $0.width.equalTo(view.frame.width / 2)
//        }
//        container2.snp.makeConstraints {
//            $0.leading.equalTo(container1.snp.trailing)
//            $0.top.bottom.equalToSuperview()
//            $0.width.equalTo(view.frame.width / 2)
//        }
//        container3.snp.makeConstraints {
//            $0.leading.equalTo(container2.snp.trailing)
//            $0.top.bottom.equalToSuperview()
//            $0.width.equalTo(view.frame.width / 2)
//            $0.trailing.equalTo(scrollView.snp.trailing)
//        }
//
//    }
//
//    private func configureTableView() {
//        CompareScrollManager.shared.observer1 = tableView.observer
//        CompareScrollManager.shared.observer2 = tableView2.observer
//        CompareScrollManager.shared.observer3 = tableView3.observer
//
//        container1.addSubview(tableView.view)
//        tableView.view.frame = container1.bounds
//        container2.addSubview(tableView2.view)
//        tableView2.view.frame = container2.bounds
//        container3.addSubview(tableView3.view)
//        tableView3.view.frame = container3.bounds
//    }
//
//    private func configureSeparator() {
//        container1.addSubview(tableViewSeparator)
//        tableViewSeparator.backgroundColor = .lightGray
//        tableViewSeparator.snp.makeConstraints {
//            $0.trailing.equalToSuperview()
//            $0.top.bottom.equalToSuperview()
//            $0.width.equalTo(0.5)
//        }
//
//        container2.addSubview(tableViewSeparator2)
//        tableViewSeparator2.backgroundColor = .lightGray
//        tableViewSeparator2.snp.makeConstraints {
//            $0.trailing.equalToSuperview()
//            $0.top.bottom.equalToSuperview()
//            $0.width.equalTo(0.5)
//        }
//    }
//
//}
