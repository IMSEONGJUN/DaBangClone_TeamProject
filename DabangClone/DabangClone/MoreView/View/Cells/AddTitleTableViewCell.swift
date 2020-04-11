//
//  AddTitleTableViewCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/02.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class AddTitleTableViewCell: UITableViewCell {
  
  static let identifier = "TitleCell"
    
    let titleLabel = UILabel().then {
      $0.text = "결정할 때 필요한 정보이므로 정확히 입력하세요."
      $0.textAlignment = .center
      $0.textColor = .black
      $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }

      override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }

      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

          // Configure the view for the selected state
      }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      
      
      setupUI()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
      addSubview(titleLabel)
      
      setupConstraints()
    }
    
    private func setupConstraints() {
      
      titleLabel.snp.makeConstraints {
        $0.center.equalToSuperview()
      }
      
    }
    
  }
