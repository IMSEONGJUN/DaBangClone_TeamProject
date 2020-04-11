//
//  Setting.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation

struct Setting {
  let name: String
  let options: [Option]
}

struct Option {
  let title: String
  let detail: String
}

let settingDatas: [Setting] = [
  Setting(name: "정보 동의 설정", options: [
    Option(title: "마케팅 정보 수신 동의", detail: "마케팅 정부 수신에 대한 동의")
  ]),
  Setting(name: "푸시 알림 수신 설정", options: [
    Option(title: "부동산 리뷰 댓글 푸시 알림 수신", detail: "부동산 리뷰 작성 후 공인중개사가 댓글을 달면 알려 드립니다."),
    Option(title: "신규 매몰 등록 푸시 알림 수신", detail: "관심지역 또는 찜한 단지에 신규매몰이 등록되면 알려드립니다."),
    Option(title: "분양 정보 일정 알림", detail: "알림받기로 한 분양정보의 일정을 알려드립니다.")
    
  ])
]

struct Marketing {
  let name: String
  let MarketingDetails: [MarketingDetail]
}

struct MarketingDetail {
  let title: String
  let detail: String
}

let maketingDatas: [Marketing] = [
  Marketing(name: "(주)스테이션3는 「개인정보보호법」 및 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 등 관계법령에 따라 광고성정보 전송을 위한 사전 수신동의를 받고 있습니다.", MarketingDetails: [
    MarketingDetail(title: "전송방법", detail: "고객님의 모바일 앱푸시, 이메일, 문자를 통해 전달될 수 있습니다."),
    MarketingDetail(
      title: "전송내용",
      detail:
      """
발송되는 정보는 다방이 제공하는 이벤트 및 혜택정보, 부동산 리뷰, 신규매물, 분양정보 등의 알림의 정보를 관련 법의 규정을 준수하여 발송합니다.
단, 광고성 정보 이외 의무적으로 안내되어야 하는 정보성 내용은 수신동의 여부와 무관하게 제공됩니다.
"""
    ),
    MarketingDetail(title: "전송방법", detail: "수신동의 이후라도 동의를 철회할 수 있으며, 동의하지 않아도 회사가 제공하는 기본적인 서비스를 이용할 수 있습니다."),
    MarketingDetail(title: "수신동의변경", detail: "다방 App / Web 서비스를 통해 마케팅 정보 수신동의를 변경(동의/철회)할 수 있습니다.")
  ])
]
