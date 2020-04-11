//
//  RoomInfoCell.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit

protocol RoomInfoCellDelegate: class {
    func didTapCheckButton(cell: RoomInfoCell, isChecked: Bool)
}

class RoomInfoCell: UITableViewCell {
    static let identifier = "RoomInfoCell"

    weak var delegate: RoomInfoCellDelegate?
    
    let overralContainerView = UIView()
    let checkButtonToCompare = UIButton()
    let roomImageView = UIImageView()
    
    var isCheckButtonSelected = false {
        didSet{
            checkButtonToCompare.isSelected = isCheckButtonSelected
            delegate?.didTapCheckButton(cell: self, isChecked: isCheckButtonSelected)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCheckButton()
        configureOverralContainerView()
        setNotiCenter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func configureCheckButton() {
        contentView.backgroundColor = .white
        contentView.addSubview(checkButtonToCompare)
        checkButtonToCompare.setImage(#imageLiteral(resourceName: "unChecked").withRenderingMode(.alwaysOriginal), for: .normal)
        checkButtonToCompare.setImage(#imageLiteral(resourceName: "checked").withRenderingMode(.alwaysOriginal), for: .selected)
        checkButtonToCompare.addTarget(self, action: #selector(didTapCheckButton), for: .touchUpInside)
        checkButtonToCompare.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(15)
            $0.width.height.equalTo(25)
        }
    }
    
    private func configureOverralContainerView() {
        overralContainerView.clipsToBounds = true
        contentView.addSubview(overralContainerView)
        overralContainerView.addSubview(roomImageView)
        roomImageView.contentMode = .scaleAspectFit
        overralContainerView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        roomImageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setNotiCenter() {
        NotificationCenter.default.addObserver(forName: FavoriteListViewController.compareModeOn, object: nil,
                                               queue: .main) { [weak self] (noti) in
                                                guard let self = self else { return }
                                                UIView.animate(withDuration: 0.3) {
                                                    self.overralContainerView.transform = CGAffineTransform(translationX: 50, y: 0)
                                                    }
                                                }
        NotificationCenter.default.addObserver(forName: FavoriteListViewController.compareModeOff, object: nil,
                                                queue: .main) { [weak self] (noti) in
                                                 guard let self = self else { return }
                                                    UIView.animate(withDuration: 0.3) {
                                                        self.overralContainerView.transform = .identity
                                                        self.isCheckButtonSelected = false
                                                    }
                                                 }
    }
    
    func set(roomInfo: RoomInfo) {
        roomImageView.image = roomInfo.image
    }
    
    @objc private func didTapCheckButton(_ sender: UIButton) {
        isCheckButtonSelected.toggle()
        sender.isSelected = isCheckButtonSelected
    }
}
