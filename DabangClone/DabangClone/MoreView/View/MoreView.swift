//
//  moreView.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import Then
import SnapKit

protocol MoreViewDelegate {
  func didTapSellMyRoomButton(_ sender: MoreViewButtons)
}

class MoreView: UIView {
  
  let scrollView = UIScrollView()
  let contentView = UIView()
  
  var delegate: MoreViewDelegate?

  //MARK: - 프로퍼티
  let userName = "PandaMan"
  let userEmail = "user@user.com"
  
  let userNameLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    $0.textAlignment = .left
    $0.text = "Pandaman"
  }
  let userEmailLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 14, weight: .light)
    $0.textAlignment = .left
    $0.text = "user@user.com"
    $0.textColor = .gray
  }
  let fixInfoButton = UIButton().then {
    $0.layer.borderColor = UIColor(named: "DabangLightBlue")?.cgColor
    $0.layer.borderWidth = 1
    $0.layer.cornerRadius = 3
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    $0.setTitle("정보수정", for: .normal)
    $0.setTitleColor(UIColor(named: "DabangLightBlue"), for: .normal)
    $0.backgroundColor = .white
    //width = 56
  }
  let profilePhotoImageView = UIButton().then {
    $0.setImage(UIImage(named: "profileImage"), for: .normal)
  }
  let addProfilePhotoImageButton = UIButton().then {
    $0.setImage(UIImage(named: "addProfileImage"), for: .normal)
  }
  
  let notibutton = UIButton().then {
    $0.setImage(UIImage(named: "noticeImage"), for: .normal)
    $0.tag = 1
  }
  let notibuttonLabel = UILabel().then {
    $0.text = "알림"
    $0.font = UIFont.systemFont(ofSize: 13, weight: .light)
    $0.addCharacterSpacing()
  }
  
  let sellRoomButton = UIButton().then {
    $0.setImage(UIImage(named: "sellRoomImage"), for: .normal)
    $0.tag = 0
  }
  
  let sellRoomLabel = UILabel().then {
    $0.text = "방내놓기"
    $0.font = UIFont.systemFont(ofSize: 13, weight: .light)
    $0.addCharacterSpacing()
  }
  
  let myReviewButton = UIButton().then {
    $0.setImage(UIImage(named: "myReviewImage"), for: .normal)
  }
  
  let myReviewLabel = UILabel().then {
    $0.text = "내가쓴리뷰"
    $0.font = UIFont.systemFont(ofSize: 13, weight: .light)
    $0.addCharacterSpacing()
  }
  
  let callMarketButton = UIButton().then {
    $0.setImage(UIImage(named: "contactedMarketImage"), for: .normal)
  }
  
  let callMarketLabel = UILabel().then {
    $0.text = "연락한부동산"
    $0.font = UIFont.systemFont(ofSize: 13, weight: .light)
    $0.addCharacterSpacing()
  }
  
  let graybezel = UIView().then {
    $0.backgroundColor = UIColor(named: "bezelColor")
    $0.frame = CGRect(x: 0, y: 0, width: 0, height: 1)
  }
  
  let graybezelTwo = UIView().then {
    $0.backgroundColor = UIColor(named: "bezelColor")
    $0.frame = CGRect(x: 0, y: 0, width: 0, height: 1)
  }
  
  let graybezelVertical = UIView().then {
    $0.backgroundColor = UIColor.lightGray
    $0.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
  }
  
  let searchRoomNumberButton = UIButton().then {
    $0.setTitle("매물번호 조회", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .regular)
    $0.setTitleColor(.black, for: .normal)
  }
  let frequentlyQuestionsButton = UIButton().then {
    $0.setTitle("자주 묻는 질문", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    $0.setTitleColor(.black, for: .normal)
    $0.addCharacterSpacing()
    $0.tag = 5
  }
  
  let eventButton = UIButton().then {
    $0.setTitle("이벤트", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    $0.setTitleColor(.black, for: .normal)
  }
  
  let noticeButton = UIButton().then {
    $0.setTitle("공지사항", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    $0.setTitleColor(.black, for: .normal)
  }
  
  let oneVsOneQuestionButton = UIButton().then {
    $0.setTitle("1:1문의", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    $0.setTitleColor(.black, for: .normal)
  }
  
  let termsButton = UIButton().then {
    $0.setTitle("이용약관", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    $0.setTitleColor(.gray, for: .normal)
  }
  
  let privacyButton = UIButton().then {
    $0.setTitle("개인정보처리방침", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    $0.setTitleColor(.gray, for: .normal)
  }
  
  let graybezelThree = UIView().then {
    $0.backgroundColor = UIColor(named: "bezelColor")
    $0.frame = CGRect(x: 0, y: 0, width: 0, height: 1)
  }
  
  let familyAppLabel = UILabel().then {
    $0.textColor = .gray
    $0.text = "패밀리 APP"
    $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
  }
  
  let dabangProImageButton = UIButton().then {
    $0.setImage(UIImage(named: "dabangProImage"), for: .normal)
  }
  
  let dabangProLabelButton = UIButton().then {
    $0.setTitle("다방프로", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 13.5, weight: .light)
    $0.setTitleColor(.gray, for: .normal)
  }
  
  let dabangSnsLabel = UILabel().then {
    $0.text = "다방 SNS"
    $0.textColor = .gray
    $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
  }
  
  let dabangFacebookImageButton = UIButton().then {
    $0.setImage(UIImage(named: "facebookImage"), for: .normal)
  }
  
  let dabangFacebookLabelButton = UIButton().then {
    $0.setTitle("페이스북", for: .normal)
    $0.setTitleColor(.gray, for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 13.5, weight: .light)
  }
  
  let dabangNaverImageButton = UIButton().then {
    $0.setImage(UIImage(named: "naverButtonImage"), for: .normal)
  }
  
  let dabangNaverLabelButton = UIButton().then {
    $0.setTitle("네이버포스트", for: .normal)
    $0.setTitleColor(.gray, for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 13.5, weight: .light)
  }
  
  let lowerGrayView = UIView().then {
    $0.backgroundColor = UIColor(named: "TextFieldColor")
  }
  
  let csTextLabel = UILabel().then {
    $0.attributedText = NSMutableAttributedString().normal("고객센터 ", fontSize: 14).medium("02-1899-6840", fontSize: 14)
    $0.textColor = .gray
  }
//  let csNumberLabel = UILabel().then {
//    $0.text = "02-1899-6840"
//    $0.textColor = .gray
//    $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
//  }
  
  let lowerLabelsView = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    
    setupUI(frame: frame)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI(frame: CGRect) {
    
    sellRoomButton.addTarget(self, action: #selector(didTapPresentingButton(_:)), for: .touchUpInside)
    notibutton.addTarget(self, action: #selector(didTapPresentingButton(_:)), for: .touchUpInside)
    frequentlyQuestionsButton.addTarget(self, action: #selector(didTapPresentingButton(_:)), for: .touchUpInside)
    
    contentView.addSubviews([userNameLabel, userEmailLabel, fixInfoButton, profilePhotoImageView, addProfilePhotoImageButton, notibutton, notibuttonLabel, sellRoomButton, sellRoomLabel, myReviewButton, myReviewLabel, callMarketButton, callMarketLabel, graybezel, searchRoomNumberButton, frequentlyQuestionsButton, eventButton, noticeButton, oneVsOneQuestionButton, graybezelTwo, termsButton, privacyButton, graybezelVertical, graybezelThree, familyAppLabel, dabangProImageButton, dabangProLabelButton, dabangSnsLabel, dabangFacebookImageButton, dabangFacebookLabelButton, dabangNaverImageButton, dabangNaverLabelButton, lowerGrayView, csTextLabel])
    
    scrollView.addSubview(contentView)
    self.addSubview(scrollView)
    
    setupConstraints(frame: frame)
  }
  
  private func setupConstraints(frame: CGRect) {
    
    scrollView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
      $0.width.equalTo(frame.width)
      $0.height.equalTo(frame.height - 100)
    }
    
    userNameLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(35)
      $0.leading.equalToSuperview().offset(15)
    }
    
    userEmailLabel.snp.makeConstraints {
      $0.top.equalTo(userNameLabel.snp.bottom).offset(2)
      $0.leading.equalTo(userNameLabel)
    }
    
    fixInfoButton.snp.makeConstraints {
      $0.top.equalTo(userEmailLabel.snp.bottom).offset(5)
      $0.leading.equalTo(userNameLabel)
      $0.width.equalTo(55)
      $0.height.equalTo(22)
    }
    
    profilePhotoImageView.snp.makeConstraints {
      $0.top.equalTo(userNameLabel).offset(2)
      $0.trailing.equalToSuperview().offset(-16)
      $0.width.equalToSuperview().multipliedBy(0.169)
      $0.height.equalTo(self.snp.width).multipliedBy(0.169)
    }
    
    addProfilePhotoImageButton.snp.makeConstraints {
      $0.bottom.trailing.equalTo(profilePhotoImageView)
      $0.width.height.equalTo(profilePhotoImageView.snp.width).multipliedBy(0.36)
    }
    
    notibutton.snp.makeConstraints {
      $0.top.equalTo(fixInfoButton.snp.bottom).offset(31)
      $0.leading.equalTo(userNameLabel).offset(4)
      $0.width.equalTo(30)
      $0.height.equalTo(30)
    }
    
    notibuttonLabel.snp.makeConstraints {
      $0.centerX.equalTo(notibutton)
      $0.top.equalTo(notibutton.snp.bottom).offset(8)
    }
    
    sellRoomButton.snp.makeConstraints {
      $0.top.equalTo(notibutton).offset(-2.5)
      $0.leading.equalTo(notibutton.snp.trailing).offset(30)
      $0.width.equalTo(32)
      $0.height.equalTo(34)
    }
    
    sellRoomLabel.snp.makeConstraints {
      $0.centerX.equalTo(sellRoomButton)
      $0.top.equalTo(notibuttonLabel)
    }
    
    myReviewButton.snp.makeConstraints {
      $0.top.equalTo(notibutton)
      $0.leading.equalTo(sellRoomButton.snp.trailing).offset(37)
      $0.width.equalTo(31)
      $0.height.equalTo(30)
    }
    
    myReviewLabel.snp.makeConstraints {
      $0.centerX.equalTo(myReviewButton)
      $0.top.equalTo(notibuttonLabel)
    }
    
    callMarketButton.snp.makeConstraints {
      $0.top.equalTo(notibutton).offset(-2)
      $0.leading.equalTo(myReviewButton.snp.trailing).offset(32)
      $0.width.equalTo(32)
      $0.height.equalTo(34)
    }
    callMarketLabel.snp.makeConstraints {
      $0.centerX.equalTo(callMarketButton)
      $0.top.equalTo(notibuttonLabel)
    }
    
    graybezel.snp.makeConstraints {
      $0.top.equalTo(notibuttonLabel.snp.bottom).offset(30)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    searchRoomNumberButton.snp.makeConstraints {
      $0.top.equalTo(graybezel).offset(20)
      $0.leading.equalTo(userNameLabel)
    }
    
    frequentlyQuestionsButton.snp.makeConstraints {
      $0.top.equalTo(searchRoomNumberButton)
      $0.leading.equalTo(self.snp.centerX).offset(20)
    }
    
    eventButton.snp.makeConstraints {
      $0.top.equalTo(searchRoomNumberButton.snp.bottom).offset(13)
      $0.leading.equalTo(searchRoomNumberButton)
    }
    
    noticeButton.snp.makeConstraints {
      $0.top.equalTo(eventButton)
      $0.leading.equalTo(frequentlyQuestionsButton).offset(3)
    }
    
    oneVsOneQuestionButton.snp.makeConstraints {
      $0.top.equalTo(eventButton.snp.bottom).offset(13)
      $0.leading.equalTo(eventButton)
    }
    
    graybezelTwo.snp.makeConstraints {
      $0.top.equalTo(oneVsOneQuestionButton.snp.bottom).offset(28)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    termsButton.snp.makeConstraints {
      $0.top.equalTo(graybezelTwo).offset(12)
      $0.leading.equalTo(userNameLabel)
    }
    
    graybezelVertical.snp.makeConstraints {
      $0.centerY.equalTo(termsButton)
      $0.width.equalTo(1)
      $0.height.equalTo(14)
      $0.leading.equalTo(termsButton.snp.trailing).offset(8)
    }
    
    privacyButton.snp.makeConstraints {
      $0.leading.equalTo(graybezelVertical).offset(8)
      $0.top.equalTo(termsButton)
    }
    
    graybezelThree.snp.makeConstraints {
      $0.top.equalTo(termsButton.snp.bottom).offset(12)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    familyAppLabel.snp.makeConstraints {
      $0.top.equalTo(graybezelThree).offset(28)
      $0.leading.equalTo(userNameLabel)
    }
    
    dabangProImageButton.snp.makeConstraints {
      $0.top.equalTo(familyAppLabel.snp.bottom).offset(7)
      $0.leading.equalTo(userNameLabel)
      $0.width.height.equalTo(26)
    }
    
    dabangProLabelButton.snp.makeConstraints {
      $0.centerY.equalTo(dabangProImageButton)
      $0.leading.equalTo(dabangProImageButton.snp.trailing).offset(7)
    }
    
    dabangSnsLabel.snp.makeConstraints {
      $0.top.equalTo(dabangProImageButton.snp.bottom).offset(20)
      $0.leading.equalTo(userNameLabel)
    }
    
    dabangFacebookImageButton.snp.makeConstraints {
      $0.top.equalTo(dabangSnsLabel.snp.bottom).offset(7)
      $0.leading.equalTo(userNameLabel)
      $0.width.height.equalTo(26)
    }
    
    dabangFacebookLabelButton.snp.makeConstraints {
      $0.centerY.equalTo(dabangFacebookImageButton)
      $0.leading.equalTo(dabangFacebookImageButton.snp.trailing).offset(7)
    }
    
    dabangNaverImageButton.snp.makeConstraints {
      $0.top.equalTo(dabangFacebookImageButton)
      $0.leading.equalTo(dabangFacebookLabelButton.snp.trailing).offset(12)
      $0.width.height.equalTo(26)
      
    }
    dabangNaverLabelButton.snp.makeConstraints {
      $0.centerY.equalTo(dabangNaverImageButton)
      $0.leading.equalTo(dabangNaverImageButton.snp.trailing).offset(7)
    }
    
    
    lowerGrayView.snp.makeConstraints {
      $0.top.equalTo(dabangFacebookImageButton.snp.bottom).offset(60)
      $0.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
    }
    
    csTextLabel.snp.makeConstraints {
      $0.centerX.equalTo(lowerGrayView)
      $0.top.equalTo(lowerGrayView.snp.top).offset(50)
    }
    
    
    
  }
  //MARK: Action

  @objc private func didTapPresentingButton(_ sender: UIButton) {
    print("didtap")
    switch sender.tag {
    case 0:
      delegate?.didTapSellMyRoomButton(MoreViewButtons.방내놓기)
      print("delegate working")
    case 1:
      delegate?.didTapSellMyRoomButton(MoreViewButtons.알림)
    case 5:
      delegate?.didTapSellMyRoomButton(MoreViewButtons.자주묻는질문)
    default:
      break
    }
    
    
  }
}


