//
//  BaseTableViewCell.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/16.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    private var shadowLine: UIView = {
        var shadowLine: UIView = UIView()
        shadowLine.backgroundColor = UIColor.baseLineColor()
        return shadowLine
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.white
        selectionStyle = .none
    }
    
    var hasLine: Bool? {
        didSet {
            if let line = hasLine {
                if line {
                    contentView.addSubview(shadowLine)
                    shadowLine.snp.makeConstraints { (make) in
                        make.left.equalTo(15)
                        make.height.equalTo(0.5)
                        make.bottom.right.equalTo(0)
                    }
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
