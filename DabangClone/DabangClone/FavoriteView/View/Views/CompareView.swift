//
//  CompareView.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/06.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit

protocol CompareViewDelegate: class {
    func didTapCompareButton(isCompareMode: Bool)
}

class CompareView: UIView {
    
    let noticeLabel = UILabel()
    let compareButton = UIButton()
    
    weak var delegate: CompareViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        backgroundColor = UIColor(white: 0.9, alpha: 1)
        [noticeLabel, compareButton].forEach({addSubview($0)})
        
        noticeLabel.textColor = .lightGray
        noticeLabel.text = "찜한 방의 매물을 비교해보세요."
        noticeLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        compareButton.layer.cornerRadius = 5
        compareButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        compareButton.backgroundColor = .gray
        compareButton.setTitle("비교하기", for: .normal)
        compareButton.setTitle("종료하기", for: .selected)
        compareButton.addTarget(self, action: #selector(didTapCompareButton), for: .touchUpInside)
        compareButton.setTitleColor(.white, for: .normal)
    }
    
    @objc func didTapCompareButton(_ sender: UIButton) {
        if sender.isSelected {
            self.backgroundColor = UIColor(white: 0.9, alpha: 1)
            sender.backgroundColor = .gray
            noticeLabel.text = "찜한 방의 매물을 비교해보세요."
        } else {
            self.backgroundColor = #colorLiteral(red: 0.9314877391, green: 0.9652816653, blue: 0.9995191693, alpha: 1)
            sender.backgroundColor = #colorLiteral(red: 0.3824152648, green: 0.4789102674, blue: 0.607190609, alpha: 1)
            noticeLabel.text = "비교할 매물을 선택하세요."
        }
        sender.isSelected.toggle()
        delegate?.didTapCompareButton(isCompareMode: sender.isSelected)
    }
    
    func setConstraints() {
        noticeLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalToSuperview().multipliedBy(0.7)
        }
        compareButton.snp.makeConstraints {
            $0.leading.equalTo(noticeLabel.snp.trailing).offset(30)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(66)
        }
    }
}
