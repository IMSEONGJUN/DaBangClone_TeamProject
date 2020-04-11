//
//  Model.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/04.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation
import UIKit

enum FavoriteData {
    case checkedRoomInfo([RoomInfo])
    case checkedDanziInfo([DanziInfo])
    case markedRoomInfo([RoomInfo])
    case markedDanziInfo([DanziInfo])
    case budongsanInfo([BudongsanInfo])
}


struct RoomInfo: Hashable {
    var name: String?
    var image: UIImage
}

struct DanziInfo {
    var name: String
}

struct BudongsanInfo {
    var name: String
}
