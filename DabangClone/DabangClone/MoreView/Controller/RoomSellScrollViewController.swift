//
//  RoomSellScrollViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class RoomSellScrollViewController: UIViewController {
  //MARK: - Property
  let topSegmentView = UISegmentedControl(items: ["주소", "기본정보", "추가정보", "설명"])
  
  let scrollView = UIScrollView()
  let firstContainerView = ContainerView().then {
    $0.backgroundColor = .blue
  }
  let secondContainerView = ContainerView().then {
    $0.backgroundColor = .white
  }
  let thirdContainerView = ContainerView().then {
    $0.backgroundColor = .orange
  }
  let fourthContainerView = ContainerView().then {
    $0.backgroundColor = .brown
  }
  
  

  //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white
        setupUI()
    }
  
  //MARK: - setupUI & setupConstraints
  
  private func setupUI() {
    view.addSubviews([scrollView])
    scrollView.isPagingEnabled = true
    scrollView.addSubviews([firstContainerView,secondContainerView,thirdContainerView,fourthContainerView])
    setupConstraints()
    addChildController()
  }
  private func setupConstraints() {
    scrollView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    firstContainerView.snp.makeConstraints {
      $0.leading.top.bottom.equalTo(scrollView)
      $0.width.equalTo(scrollView)
      $0.height.equalTo(scrollView)
    }
    secondContainerView.snp.makeConstraints {
      $0.leading.equalTo(firstContainerView.snp.trailing)
      $0.top.bottom.equalTo(scrollView)
      $0.width.equalTo(scrollView)
    }
    thirdContainerView.snp.makeConstraints {
      $0.leading.equalTo(secondContainerView.snp.trailing)
      $0.top.bottom.equalTo(scrollView)
      $0.width.equalTo(scrollView)
    }
    fourthContainerView.snp.makeConstraints {
      $0.leading.equalTo(thirdContainerView.snp.trailing)
      $0.trailing.equalTo(scrollView.snp.trailing)
      $0.top.bottom.equalTo(scrollView)
      $0.width.equalTo(scrollView)
    }
  }
  
  func addChildController() {
    
    let views = [firstContainerView:AddressViewController(), secondContainerView:BaseViewController(), thirdContainerView:OneRoomAddInfoViewController(), fourthContainerView:ExplainViewController()]
    
    views.forEach { add(childVC: $0.value, to: $0.key) }
  }
  
  func add(childVC: UIViewController, to containerView: ContainerView) {
      addChild(childVC)
      containerView.addSubview(childVC.view)
      childVC.view.frame = containerView.bounds
      childVC.didMove(toParent: self)
  }
}

class ContainerView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame:frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
}
