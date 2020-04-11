//
//  CompareTableViewHeader.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/09.
//  Copyright © 2020 pandaman. All rights reserved.
//

//import UIKit
//import SnapKit
//
//class CompareTableViewHeader: UIView {
//    
//    let roomIDLabel = UILabel()
//    let imageView = UIImageView()
//    let roomStyleLabel = UILabel()
//    let costLabel = UILabel()
//    
//    let separatorLine = UIView()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configure()
//        setConstraints()
//    }
//    
//    convenience init(roomID: String, image: UIImage, roomStyle: String, cost: String) {
//        self.init(frame: .zero)
//        roomIDLabel.text = "매물번호 " + roomID
//        imageView.image = image
//        roomStyleLabel.text = roomStyle
//        costLabel.text = "\(cost)"
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func configure() {
//        backgroundColor = .white
//        addSubviews([imageView, roomStyleLabel, costLabel, separatorLine])
//        imageView.addSubview(roomIDLabel)
//        
//        roomIDLabel.backgroundColor = UIColor(white: 0.2, alpha: 0.8)
//        roomIDLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
//        roomIDLabel.textAlignment = .center
//        roomIDLabel.textColor = .white
//        
//        imageView.layer.cornerRadius = 5
//        imageView.clipsToBounds = true
//        
//        roomStyleLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
//        roomStyleLabel.textColor = #colorLiteral(red: 0.2596234679, green: 0.5155771971, blue: 0.9926976562, alpha: 1)
//        roomStyleLabel.textAlignment = .left
//        
//        costLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        costLabel.textColor = #colorLiteral(red: 0.2596234679, green: 0.5155771971, blue: 0.9926976562, alpha: 1)
//        
//        separatorLine.backgroundColor = .lightGray
//        separatorLine.snp.makeConstraints {
//            $0.bottom.equalToSuperview()
//            $0.leading.trailing.equalToSuperview().inset(10)
//            $0.height.equalTo(0.5)
//        }
//    }
//    
//    private func setConstraints() {
//        imageView.snp.makeConstraints {
//            $0.top.leading.trailing.equalToSuperview().inset(10)
//            $0.height.equalTo(imageView.snp.width).multipliedBy(0.6)
//        }
//        
//        costLabel.snp.makeConstraints {
//            $0.leading.bottom.equalToSuperview().inset(10)
//        }
//        
//        roomStyleLabel.snp.makeConstraints {
//            $0.leading.equalTo(costLabel.snp.leading)
//            $0.bottom.equalTo(costLabel.snp.top).offset(-3)
//        }
//        
//        roomIDLabel.snp.makeConstraints {
//            $0.leading.trailing.bottom.equalToSuperview()
//            $0.height.equalToSuperview().multipliedBy(0.23)
//        }
//    }
//}
