//
//  BaseTableView.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/13.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit

class BaseTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        showsVerticalScrollIndicator = false
        separatorStyle = UITableViewCell.SeparatorStyle.none
        estimatedRowHeight = 0
        estimatedSectionFooterHeight = 0
        estimatedSectionHeaderHeight = 0
    }
    
    func setAutoHeight(_ height: CGFloat) {
        /// 预估行高
        estimatedRowHeight = height
        /// 自动尺寸
        rowHeight = UITableView.automaticDimension
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
