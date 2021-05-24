//
//  BaseLabel.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/30.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit

// UILabel 文本在其 frame 内垂直顶部、居中、底部对齐
enum LabelVerticalAlignment {
    case top
    case middle
    case bottom
}

class BaseLabel: UILabel {
    var verticalAlignment: LabelVerticalAlignment = .middle {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setFontSize()
        defaultColor()
        sizeToFit()
    }
    
    func setColor(_ alpha: Float = 0.5) {
        textColor = .textColor(alpha)
    }
    
    /// 默认mainFont 14
    func setFontSize(_ size: CGFloat = 16) {
        font = UIFont.systemFont(ofSize: size)
    }
    
    func setBoldFontSize(_ size: CGFloat = 16) {
        font = .boldSystemFont(ofSize: size)
    }
    
    func defaultColor() {
        textColor = .textColor(0.8)
    }
    
    func tx_center() {
        textAlignment = .center
    }
    
    func tx_left() {
        textAlignment = .left
    }
    
    func tx_right() {
        textAlignment = .right
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        switch verticalAlignment {
        case .top:
            textRect.origin.y = bounds.origin.y
        case .middle:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0
        case .bottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height
        }
        return textRect
    }
    
    override func drawText(in rect: CGRect) {
        let actualRect = textRect(forBounds: rect, limitedToNumberOfLines: numberOfLines)
        super.drawText(in: actualRect)
    }
    
}
