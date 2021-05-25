//
//  AgInt.swift
//  kb
//
//  Created by xuyazhong on 2020/5/12.
//  Copyright © 2020 xyz. All rights reserved.
//

import UIKit

extension Int {

    func format() -> String {
        if self > 1000 {
            var result = Double(self)
            result = result/1000
            return String(format: "%.1f K", result)
        }
        return String(self)
    }
    
    func fileSize() -> String {
        let size = self
        if size < 1000 {
            return "\(size) B"
        }
        if (size/1000 < 1000) {
            let result = Double(size)/1000
            return String(format: "%.2f KB", result)
        }
        if (size/1000/1000 < 1000) {
            let result = Double(size)/1000/1000
            return String(format: "%.2f MB", result)
        }
        return String(self)
    }
        
    
}
