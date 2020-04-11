//
//  FavoriteViewModel.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class FavoriteViewModel {
    
    private var checkedRoomData = [RoomInfo]()
    private var checkedDanziData = [DanziInfo]()
    private var markedRoomData = [RoomInfo]()
    private var markedDanziData = [DanziInfo]()
    private var contactBudongsanData = [BudongsanInfo]()
    
    var dataIndex = 0 {
        didSet {
            setActiveData(dataIndex)
        }
    }
    
    init() {
        checkedRoomData = [RoomInfo(image: UIImage(named: "01")!), RoomInfo(image: UIImage(named: "02")!), RoomInfo(image: UIImage(named: "03")!)]
        markedRoomData = [RoomInfo(image: UIImage(named: "01")!), RoomInfo(image: UIImage(named: "02")!), RoomInfo(image: UIImage(named: "03")!), RoomInfo(image: UIImage(named: "04")!)]
    }
    
    lazy var activeData = FavoriteData.checkedRoomInfo(checkedRoomData)
    
    lazy var data: [FavoriteData] = [
        .checkedRoomInfo(checkedRoomData),
        .checkedDanziInfo(checkedDanziData),
        .markedRoomInfo(markedRoomData),
        .markedDanziInfo(markedDanziData),
        .budongsanInfo(contactBudongsanData)
    ]
    
    func setActiveData(_ dataIndex: Int) {
        activeData = data[dataIndex]
    }
    
    func checkActiveDataCount() -> Int {
        switch activeData {
        case .checkedRoomInfo(let rooms):
            return rooms.count
        case .checkedDanziInfo(let danzis):
            return danzis.count
        case .markedRoomInfo(let rooms):
            return rooms.count
        case .markedDanziInfo(let danzis):
            return danzis.count
        case .budongsanInfo(let budongsans):
            return budongsans.count
        }
    }
    
    func checkActiveDataAndSetCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, on viewController: FavoriteListViewController) -> UITableViewCell {
        switch activeData {
        case .checkedRoomInfo(let rooms):
            let cell = tableView.dequeueReusableCell(withIdentifier: RoomInfoCell.identifier, for: indexPath) as! RoomInfoCell
//            cell.delegate = viewController
            cell.set(roomInfo: rooms[indexPath.row])
            return cell
        case .checkedDanziInfo(let danzis):
            let cell = tableView.dequeueReusableCell(withIdentifier: DanziInfoCell.identifier, for: indexPath) as! DanziInfoCell
            cell.set(danziInfo: danzis[indexPath.row])
            return cell
        case .markedRoomInfo(let rooms):
            let cell = tableView.dequeueReusableCell(withIdentifier: RoomInfoCell.identifier, for: indexPath) as! RoomInfoCell
            cell.delegate = viewController
            cell.set(roomInfo: rooms[indexPath.row])
            return cell
        case .markedDanziInfo(let danzis):
            let cell = tableView.dequeueReusableCell(withIdentifier: DanziInfoCell.identifier, for: indexPath) as! DanziInfoCell
            cell.set(danziInfo: danzis[indexPath.row])
            return cell
        case .budongsanInfo(let budongsan):
            let cell = tableView.dequeueReusableCell(withIdentifier: BudongsanInfoCell.identifier, for: indexPath) as! BudongsanInfoCell
            cell.set(info: budongsan[indexPath.row])
            return cell
        }
        
    }
}
