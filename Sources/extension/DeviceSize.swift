//
//  DeviceSize.swift
//  qiyeos
//
//  Created by xuyazhong on 2019/12/1.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit

struct DeviceSzie {
    
    enum DeviceType {
        case iphone4
        case iphone5
        case iphone6
        case iphone6p
    }
    
    //判断屏幕类型
    static func currentSize() -> DeviceType {
        switch (kScreenWidth, kScreenHeight) {
        case (320, 480),(480, 320):
            return .iphone4
        case (320, 568),(568, 320):
            return .iphone5
        case (375, 667),(667, 375):
            return .iphone6
        case (414, 736),(736, 414):
            return .iphone6p
        default:
            print("width => \(kScreenWidth) height => \(kScreenHeight)")
            return .iphone6
        }
    }
}
