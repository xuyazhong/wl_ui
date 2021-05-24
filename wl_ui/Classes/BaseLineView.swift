//
//  BaseLineView.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/13.
//  Copyright © 2019 xyz. All rights reserved.
//

import Foundation
import UIKit
class BaseLineView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.LineChartColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
