//
//  CompareViewController.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit

class CompareViewController: UIViewController {

    let noticeView = UIView()
    let noticeLabel = UILabel()
    
    var roomsToCompare: [IndexPath : RoomInfo]!
    
    let overralScrollView = UIScrollView()
    let detailScrollView = UIScrollView()
    
    let detail1 = CompareDetailView()
    let detail2 = CompareDetailView()
    let detail3 = CompareDetailView()
    
    var askButton1 = CompareViewAskButton()
    var askButton2 = CompareViewAskButton()
    var askButton3 = CompareViewAskButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        configureNoticePart()
        configureScrollView()
        configureHeaderViews()
        configureDetailViews()
        configureAskButtons()
    }
    
    private func setNavigationBar() {
        title = "비교하기"
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(didTapCloseButton))
        navigationItem.leftBarButtonItem = leftBarButton
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func configureNoticePart() {
        view.addSubview(noticeView)
        noticeView.addSubview(noticeLabel)
        noticeView.backgroundColor = #colorLiteral(red: 0.9646322131, green: 0.9647476077, blue: 0.9645928741, alpha: 1)
        noticeLabel.textColor = .lightGray
        noticeLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        noticeLabel.text = "3개의 방을 비교한 후, 원하는 방을 문의하세요."
        
        noticeView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        noticeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func configureScrollView() {
        view.addSubview(overralScrollView)
        overralScrollView.isDirectionalLockEnabled = true
        overralScrollView.showsVerticalScrollIndicator = false
//        if roomsToCompare.count < 3 { overralScrollView.isScrollEnabled = false }

        overralScrollView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(noticeView.snp.bottom)
        }
        
        overralScrollView.addSubview(detailScrollView)
        detailScrollView.clipsToBounds = true
        detailScrollView.snp.makeConstraints {
            $0.top.equalTo(overralScrollView.snp.top).offset(190)
            $0.leading.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }

    private func configureHeaderViews() {
        let header1 = CompareHeaderView(roomID: "1234567", image: UIImage(named: "d1")!, roomStyle: "월세", cost: "5억/150")
        let header2 = CompareHeaderView(roomID: "2344234", image: UIImage(named: "d2")!, roomStyle: "월세", cost: "10억/50")
        let header3 = CompareHeaderView(roomID: "7815481", image: UIImage(named: "d3")!, roomStyle: "월세", cost: "8억/100")
        
        [header1, header2, header3].forEach({overralScrollView.addSubview($0)})
        header1.snp.makeConstraints {
            $0.top.leading.equalTo(overralScrollView)
            $0.height.equalTo(190)
            $0.width.equalTo(view.frame.width / 2)
        }
        header2.snp.makeConstraints {
            $0.top.equalTo(overralScrollView)
            $0.leading.equalTo(header1.snp.trailing)
            $0.height.equalTo(190)
            $0.width.equalTo(view.frame.width / 2)
        }
        header3.snp.makeConstraints {
            $0.top.equalTo(overralScrollView)
            $0.leading.equalTo(header2.snp.trailing)
            $0.height.equalTo(190)
            $0.width.equalTo(view.frame.width / 2)
            $0.trailing.equalTo(overralScrollView.snp.trailing)
        }
    }
    
    private func configureDetailViews() {
        [detail1, detail2, detail3].forEach({detailScrollView.addSubview($0)})

        detail1.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(180)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(detailScrollView)
        }
        detail2.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(180)
            $0.leading.equalTo(detail1.snp.trailing)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(detailScrollView)
        }
        detail3.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(180)
            $0.leading.equalTo(detail2.snp.trailing)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(detailScrollView)
            $0.trailing.equalToSuperview()
        }
    }
    
    private func configureAskButtons() {
        detailScrollView.addSubviews([askButton1,askButton2,askButton3])
        [askButton1,askButton2,askButton3].forEach({
            $0.addTarget(self, action: #selector(didTapAskButton(_:)), for: .touchUpInside)
        })
        
        askButton1.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(50)
        }
        askButton2.snp.makeConstraints {
            $0.leading.equalTo(askButton1.snp.trailing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(50)
        }
        askButton3.snp.makeConstraints {
            $0.leading.equalTo(askButton2.snp.trailing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(50)
        }

    }
    
    @objc func didTapAskButton(_ sender: UIButton) {
        
    }
    
    @objc func didTapCloseButton() {
        dismiss(animated: true)
    }

}
