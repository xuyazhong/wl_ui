//
//  BaseButton.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/5/21.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit
import SnapKit

class BaseButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        titleLabel?.font = UIFont.mainFont()
    }
    
    func defaultColor() {
        setTitleColor(UIColor.black, for: .normal)
    }
    
    func addLeftLine() {
        let line = BaseLineView()
        addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(0)
            make.width.equalTo(1)
        }
    }
    
    func addRightLine() {
        let line = BaseLineView()
        addSubview(line)
        line.snp.makeConstraints { (make) in
            make.right.top.bottom.equalTo(0)
            make.width.equalTo(1)
        }
    }
    
    func addBottomLine() {
        let line = BaseLineView()
        addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(1)
        }
    }
    
    func addTopLine() {
        let line = BaseLineView()
        addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.height.equalTo(1)
        }
    }
    
    func setSmallFont() {
        titleLabel?.font = UIFont.smallFisrtLevelFont()
    }
    
    func setBoldFont(_ size: CGFloat = 16) {
        titleLabel?.font = UIFont.boldSystemFont(ofSize: size)
    }
    
    func setFont(_ size: CGFloat = 16) {
        titleLabel?.font = UIFont.systemFont(ofSize: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
