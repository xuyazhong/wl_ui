//
//  BaseCollectionView.swift
//  qiyeos
//
//  Created by xuyazhong on 2019/10/18.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
