//
//  DebugView.swift
//  qiyeos
//
//  Created by xuyazhong on 2019/10/30.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit

class DebugView: UIView {
    var mock: BaseButton = {
        var btn = BaseButton()
        btn.tag = 1
        btn.setTitle("本地", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.red, for: .selected)
        btn.backgroundColor = UIColor.purple
        btn.addTarget(self, action: #selector(actionClick), for: .touchUpInside)
        return btn
    }()
    var online: BaseButton = {
        var btn = BaseButton()
        btn.tag = 2
        btn.isSelected = true
        btn.setTitle("开发", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.red, for: .selected)
        btn.backgroundColor = UIColor.purple
        btn.addTarget(self, action: #selector(actionClick), for: .touchUpInside)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mock)
        addSubview(online)
        mock.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.width.equalTo(40)
            make.height.equalTo(20)
            make.bottom.equalTo(-5)
            make.left.equalTo(0)
        }
        online.snp.makeConstraints { (make) in
            make.width.height.top.equalTo(mock)
            make.left.equalTo(mock.snp.right).offset(5)
        }
    }
    
    @objc func actionClick (_ sender: BaseButton) {
        let tag = sender.tag
        mock.isSelected = mock.tag == tag
        online.isSelected = online.tag == tag
        BaseUserManager.sharedInstance.isLocal = tag == 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
