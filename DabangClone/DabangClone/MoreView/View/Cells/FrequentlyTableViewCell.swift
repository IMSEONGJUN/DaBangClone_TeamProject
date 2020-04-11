//
//  FrequentlyTableViewCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/25.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FrequentlyTableViewCell: UITableViewCell {

  static let identifier = "Cell"
  
  var contentsView = UIView().then {
    $0.backgroundColor = UIColor(named: "questionBGColor")
  }
  var contentLabel = UILabel().then {
    $0.lineBreakMode = NSLineBreakMode.byWordWrapping
    $0.numberOfLines = 0
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  override func updateConstraints() {
    super.updateConstraints()
    
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupUI() {
    
    contentView.addSubviews([contentsView, contentLabel])
    
    setupConstraints()
  }
  
  func setupConstraints() {
    
    contentLabel.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20))
    }
    
    contentsView.snp.makeConstraints {
      $0.top.equalTo(contentLabel.snp.top).offset(-10)
      $0.leading.equalTo(contentLabel).offset(-10)
      $0.trailing.equalTo(contentLabel).offset(10)
      $0.bottom.equalTo(contentLabel).offset(10)
    }
    
    
  }
  
  func configure() {
    
  }
}
