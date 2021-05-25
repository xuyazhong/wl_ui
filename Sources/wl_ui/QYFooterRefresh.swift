//
//  QYFooterRefresh.swift
//  qiyeos
//
//  Created by xuyazhong on 2020/3/9.
//  Copyright © 2020 xyz. All rights reserved.
//

import UIKit
import MJRefresh

class QYFooterRefresh: MJRefreshBackGifFooter {
    
    override func prepare() {
        super.prepare()
        
        setTitle("上拉加载更多", for: MJRefreshState.idle)
        setTitle("快松开", for: MJRefreshState.pulling)
        setTitle("刷新中...", for: MJRefreshState.willRefresh)
        setTitle("加载中...", for: MJRefreshState.refreshing)
        setTitle("没有更多了", for: MJRefreshState.noMoreData)
        
//        var animateImages: [UIImage] = []
//        for i in 1..<5 {
//            let name = String(format: "animate%d", i)
//            if let img = UIImage(named: name) {
//                animateImages.append(img)
//            }
//        }
//        let empty = #imageLiteral(resourceName: "white")
//        setImages([empty], duration: 0.8, for: .idle)
//        setImages(animateImages, duration: 0.8, for: .refreshing)
//        setImages(animateImages, duration: 0.8, for: .pulling)
        
    }
    
}
