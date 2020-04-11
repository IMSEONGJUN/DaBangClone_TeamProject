//
//  EmptyStateView.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/06.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit

enum Messages {
    static let noRecentlyCheckRoom = "최근 본 방이 없습니다."
    static let noRecentlyCheckDanzi = "최근 본 단지가 없습니다."
    static let noMarkedRoom = "찜 한 방이 없습니다."
    static let noMarkedDanzi = "찜 한 단지가 없습니다."
    static let noContactedBudongsan = "연락한 부동산이 없습니다."
}

enum Details {
    static let noRecentlyCheckRoom = "다방에서 살고 싶은 방을 찾아보세요."
    static let noRecentlyCheckDanzi = "다방에서 살고 싶은 오피스텔, 아파트를 찾아보세요."
    static let noMarkedRoom = "살고 싶은 방을 발견하면 찜 해주세요!"
    static let noMarkedDanzi = "살고 싶은 오피스텔, 아파트를 발견하면 찜 해주세요!"
    static let noContactedBudongsan = "전화나 메시지로 연락한 부동산을 여기서 확인하세요!"
}


class EmptyStateView: UIView {
    
    let noticeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(message: String, detail: String) {
        self.init(frame: .zero)
        let messages = NSMutableAttributedString(string: message, attributes: [.font:UIFont.systemFont(ofSize: 19, weight: .heavy)])
        let detail = NSAttributedString(string: "\n" + detail, attributes: [.font:UIFont.systemFont(ofSize: 16, weight: .medium)])
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        paragraphStyle.alignment = .center
        
        messages.append(detail)
        messages.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: messages.length))
        noticeLabel.attributedText = messages
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        backgroundColor = .white
        addSubview(noticeLabel)
        noticeLabel.numberOfLines = 2
        noticeLabel.textColor = .lightGray
        noticeLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9)
        }
    }
}
