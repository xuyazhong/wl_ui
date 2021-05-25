//
//  BaseRightBtns.swift
//  kb
//
//  Created by xuyazhong on 2020/8/21.
//  Copyright © 2020 xyz. All rights reserved.
//

import UIKit

class BaseRightBtns: BaseNavigationView {

    lazy var sharedBtn: BaseButton = {
        var sharedBtn: BaseButton = BaseButton()
        sharedBtn.setImage(UIImage(named: "share"), for: .normal)
        return sharedBtn
    }()

    override func setupSubViewsSnp() {
        super.setupSubViewsSnp()
        if let rightBtn = rightButton {
            addSubview(sharedBtn)
            sharedBtn.snp.makeConstraints { (make) in
                make.width.height.equalTo(22)
                make.centerY.equalTo(rightBtn)
                make.right.equalTo(rightBtn.snp.left).offset(-10)
            }
        }
        
    }
    
}
