//
//  CompareViewAskButton.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class CompareViewAskButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = #colorLiteral(red: 0.2596234679, green: 0.5155771971, blue: 0.9926976562, alpha: 1)
        setTitle("문의하기", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        let separatorLine = UIView()
        separatorLine.backgroundColor = .lightGray
        addSubview(separatorLine)
        separatorLine.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalTo(0.5)
        }
    }
}
