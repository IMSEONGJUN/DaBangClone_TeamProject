//
//  AlertView.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit

class AlertVC: UIViewController {

    let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        configureContainerView()
    }
    
    private func configureContainerView() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.8)
            $0.height.equalTo(containerView.frame.width + 50)
        }
    }
}
