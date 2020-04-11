//
//  InfoModel.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/01.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation
import UIKit

enum BaseInfo {
  case 빈케이스
  case 가격
  case 층수
  case 방크기
  case 단기임대
  case 관리비
  case 주차
  case 입주가능일
}

enum AdditionalInfo {
  case 빈케이스
  case 옵션
  case 난방종류
  case 반려동물
  case 엘리베이터
  case 복층
  case 일쩜오룸
  case 빌트인
  case 베란다
  case 전세자금대출
  case 준공년도
}

enum CellType {
  case Title
  case Input
  case AbleSegment
  case IsThere
  case ThreeSegment
  case CheckBox
}

extension BaseInfo {
  func setTitle() -> String {
    var title: String!
    switch self {
    case BaseInfo.빈케이스:
      title = ""
    case BaseInfo.가격:
      title = "가격"
    case BaseInfo.층수:
      title = "층수"
    case BaseInfo.방크기:
      title = "방 크기"
    case BaseInfo.단기임대:
      title = "단기임대"
    case BaseInfo.관리비:
      title = "관리비"
    case BaseInfo.주차:
      title = "주차"
    case BaseInfo.입주가능일:
      title = "입주가능일"
    }
    return title
  }
}

extension AdditionalInfo {
  func setTitle() -> String {
    var title: String!
    switch self {
    case AdditionalInfo.빈케이스:
      title = ""
    case AdditionalInfo.옵션:
      title = "옵션"
    case AdditionalInfo.난방종류:
      title = "난방종류"
    case AdditionalInfo.반려동물:
      title = "반려동물"
    case AdditionalInfo.엘리베이터:
      title = "엘리베이터"
    case AdditionalInfo.복층:
      title = "복층"
    case AdditionalInfo.일쩜오룸:
      title = "1.5룸, 주방분리형"
    case AdditionalInfo.빌트인:
      title = "빌트인"
    case AdditionalInfo.베란다:
      title = "베란다/발코니"
    case AdditionalInfo.전세자금대출:
      title = "전세자금대출"
    case AdditionalInfo.준공년도:
        title = "준공년도"
    }
    return title
  }
}

  func setTableViewCell(tableView: UITableView, indexPath: IndexPath, title: BaseInfo = .빈케이스, CellType: CellType) -> UITableViewCell {
    switch CellType {
    case .Title:
      let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as! TitleTableViewCell
      return cell
    case .Input:
      let cell = tableView.dequeueReusableCell(withIdentifier: InputCell.identifier, for: indexPath) as! InputCell
      cell.configure(title: title)
      return cell
    case .AbleSegment:
      let cell = tableView.dequeueReusableCell(withIdentifier: AbleSegmentCell.identifier, for: indexPath) as! AbleSegmentCell
      cell.configure(title: title)
      return cell
    case .IsThere:
      let cell = tableView.dequeueReusableCell(withIdentifier: IsThereCell.identifier, for: indexPath) as! IsThereCell
      cell.configure(title: title)
      return cell
    case .ThreeSegment:
      let cell = tableView.dequeueReusableCell(withIdentifier: ThreeSegmentTableViewCell.identifier, for: indexPath) as! ThreeSegmentTableViewCell
      cell.configure(title: title)
      return cell
    case .CheckBox:
      let cell = tableView.dequeueReusableCell(withIdentifier: CheckBoxCell.identifier, for: indexPath) as! CheckBoxCell
      return cell
      
    }
  }

func setAddtionalTableViewCell(tableView: UITableView, indexPath: IndexPath, title: AdditionalInfo = .빈케이스, CellType: CellType) -> UITableViewCell {
  switch CellType {
  case .Title:
    let cell = tableView.dequeueReusableCell(withIdentifier: AddTitleTableViewCell.identifier, for: indexPath) as! AddTitleTableViewCell
    return cell
  case .Input:
    let cell = tableView.dequeueReusableCell(withIdentifier: InputCell.identifier, for: indexPath) as! InputCell
    cell.configure(AdditionalTitle: title)
    return cell
  case .AbleSegment:
    let cell = tableView.dequeueReusableCell(withIdentifier: AbleSegmentCell.identifier, for: indexPath) as! AbleSegmentCell
    cell.configure(AdditionalTitle: title)
    return cell
  case .IsThere:
    let cell = tableView.dequeueReusableCell(withIdentifier: IsThereCell.identifier, for: indexPath) as! IsThereCell
    cell.configure(AdditionalTitle: title)
    return cell
  case .ThreeSegment:
    let cell = tableView.dequeueReusableCell(withIdentifier: ThreeSegmentTableViewCell.identifier, for: indexPath) as! ThreeSegmentTableViewCell
    cell.configure(AdditionalTitle: title)
    return cell
  case .CheckBox:
    let cell = tableView.dequeueReusableCell(withIdentifier: CheckBoxCell.identifier, for: indexPath) as! CheckBoxCell
    cell.configure(AdditionalTitle: title)
    return cell
    
  }
}

