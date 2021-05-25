//
//  AgDate.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/5/27.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit

extension Date {
    
    func toString () -> String {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.calendar = calendar
        let destDateString = dateFormatter.string(from: self)
        return destDateString
    }
    
    func toStringHMS () -> String {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.calendar = calendar
        let destDateString = dateFormatter.string(from: self)
        return destDateString
    }
    
    func toMMddHHmm() -> String {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd HH:mm"
        dateFormatter.calendar = calendar
        let destDateString = dateFormatter.string(from: self)
        return destDateString
    }
    
    func toMMdd() -> String {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        dateFormatter.calendar = calendar
        let destDateString = dateFormatter.string(from: self)
        return destDateString
    }
    
    func toMMddDay() -> String {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM月dd日"
        dateFormatter.calendar = calendar
        let destDateString = dateFormatter.string(from: self)
        return destDateString
    }
    
    func toHHmm() -> String {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.calendar = calendar
        let destDateString = dateFormatter.string(from: self)
        return destDateString
    }
    
    var timeStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return "\(timeStamp)"
    }
    
}
