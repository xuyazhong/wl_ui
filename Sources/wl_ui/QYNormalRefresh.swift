//
//  QYNormalRefresh.swift
//  qiyeos
//
//  Created by xuyazhong on 2019/11/29.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit
import MJRefresh

class QYNormalRefresh: MJRefreshNormalHeader {

    override init(frame: CGRect) {
        super.init(frame: frame)
        lastUpdatedTimeLabel?.isHidden = true
        setTitle("下拉刷新", for: MJRefreshState.willRefresh)
        setTitle("下拉刷新", for: MJRefreshState.idle)
        setTitle("释放更新", for: MJRefreshState.pulling)
        setTitle("加载中...", for: MJRefreshState.refreshing)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
