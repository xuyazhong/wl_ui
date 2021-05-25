//
//  MixUIView.swift
//  kb
//
//  Created by xuyazhong on 2020/7/23.
//  Copyright © 2020 xyz. All rights reserved.
//

import UIKit

extension UIView {
    
    func bottomLine() {
        let shadowLine = BaseLineView()
        addSubview(shadowLine)
        shadowLine.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.height.equalTo(0.5)
            make.bottom.right.equalTo(0)
        }
    }
    func bottomLine(margin: CGFloat) {
        let shadowLine = BaseLineView()
        addSubview(shadowLine)
        shadowLine.snp.makeConstraints { (make) in
            make.left.equalTo(margin)
            make.right.equalTo(-margin)
            make.height.equalTo(0.5)
            make.bottom.equalTo(0)
        }
    }
    func topLine() {
        let shadowLine = BaseLineView()
        addSubview(shadowLine)
        shadowLine.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.height.equalTo(0.5)
            make.top.right.equalTo(0)
        }
    }
    
    func fullTopLine() {
        let shadowLine = BaseLineView()
        addSubview(shadowLine)
        shadowLine.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.height.equalTo(0.5)
            make.top.right.equalTo(0)
        }
    }
    
    func fullBottomLine() {
        let shadowLine = BaseLineView()
        addSubview(shadowLine)
        shadowLine.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.height.equalTo(0.5)
            make.bottom.right.equalTo(0)
        }
    }
    
    func fullBottomLine(_ color: UIColor) {
        let shadowLine: UIView = UIView()
        shadowLine.backgroundColor = color
        addSubview(shadowLine)
        shadowLine.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.height.equalTo(0.5)
            make.bottom.right.equalTo(0)
        }
    }
    
}
