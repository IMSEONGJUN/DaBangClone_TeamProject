//
//  CompareViewModel.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class CompareScrollManager {
    
    var scrollYOffset: CGFloat = 0 {
        didSet {
            observer?(scrollYOffset)
        }
    }
    
    var observer: ((CGFloat) ->())?
}
