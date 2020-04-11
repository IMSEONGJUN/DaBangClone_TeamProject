//
//  CompareCellTitleStack.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/09.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit

class CompareCellInsideStack: UIStackView {
    
    let title: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    let detail: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(title: String, detail: String? = nil) {
        self.init(frame: .zero)
        self.title.text = title
        self.detail.text = detail
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        axis = .horizontal
        alignment = .top
        distribution = .fill
        spacing = 10
        [title, detail].forEach({addArrangedSubview($0)})
        title.snp.makeConstraints {
            $0.width.equalTo(26)
        }
        
    }
    
}
