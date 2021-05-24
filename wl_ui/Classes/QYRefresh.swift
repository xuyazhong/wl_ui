//
//  QYRefresh.swift
//  kb
//
//  Created by xuyazhong on 2020/5/28.
//  Copyright © 2020 xyz. All rights reserved.
//

import UIKit
import MJRefresh

class QYRefresh: MJRefreshGifHeader {
    
    override func prepare() {
        super.prepare()
        lastUpdatedTimeLabel?.isHidden = true
        
        labelLeftInset = 10
        setTitle("下拉刷新", for: MJRefreshState.willRefresh)
        setTitle("下拉刷新", for: MJRefreshState.idle)
        setTitle("快松手", for: MJRefreshState.pulling)
        setTitle("加载中...", for: MJRefreshState.refreshing)
        
        var animateImages: [UIImage] = []
        for i in 1..<5 {
            let name = String(format: "animate%d", i)
            if let img = UIImage(named: name) {
                animateImages.append(img)
            }
        }
        setImages(animateImages, duration: 0.8, for: .idle)
        setImages(animateImages, duration: 0.8, for: .refreshing)
        setImages(animateImages, duration: 0.8, for: .pulling)
        
    }
    
}
