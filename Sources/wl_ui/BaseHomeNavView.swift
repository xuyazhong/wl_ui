//
//  BaseHomeNavView.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/6/14.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit
import SnapKit

class BaseHomeNavView: BaseNavigationView {
    
    override func getTitleView() -> UIView? {
        titleLabel = BaseLabel()
        titleLabel!.textColor = UIColor.black
        titleLabel!.font = UIFont.navTitleFont()
        return titleLabel
    }
    
    /**
     设置布局
     */
    open override func setupSubViewsSnp() -> Void {
        
        titleView!.snp.remakeConstraints { (make) in
            make.bottom.equalTo(-1)
            make.height.equalTo(BaseConst.DefaultNaviHeight)
            make.width.equalTo(200)
            make.left.equalTo(15)
        }
//        
//        if (showRight) {
//            addSubview(rightBtn)
//            rightBtn.snp.remakeConstraints { (make) in
//                make.right.equalTo(-15)
//                make.height.width.equalTo(30)
//                make.centerY.equalTo(titleView!)
//            }
//        }
        
    }
    
}
