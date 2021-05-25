//
//  AgButton.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/16.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit

extension UIButton {
    
    func right () {
        contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
    }
    
    func left () {
        contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
    }
    
    func tx_center () {
        contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
    }
    
    func dotImage(level: Int) {
        let name = (level == 1) ? "dot_1" : "dot_2"
        let img = UIImage(named: name)
        setImage(img, for: .normal)
        setImage(img, for: .selected)
    }

}


enum YWButtonEdgeInsetsStyle {
    case Top
    case Left
    case Right
    case Bottom
}

extension UIButton {
    func layoutButton(style: YWButtonEdgeInsetsStyle, imageTitleSpace: CGFloat) {
        //得到imageView和titleLabel的宽高
        let imageWidth = self.imageView?.frame.size.width
        let imageHeight = self.imageView?.frame.size.height
        
        var labelWidth: CGFloat! = 0.0
        var labelHeight: CGFloat! = 0.0
        
        labelWidth = self.titleLabel?.intrinsicContentSize.width
        labelHeight = self.titleLabel?.intrinsicContentSize.height
        
        //初始化imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        
        //根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .Top:
            //上 左 下 右
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight-imageTitleSpace/2, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth!, bottom: -imageHeight!-imageTitleSpace/2, right: 0)
            break;
            
        case .Left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -imageTitleSpace/2, bottom: 0, right: imageTitleSpace)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: imageTitleSpace/2, bottom: 0, right: -imageTitleSpace/2)
            break;
            
        case .Bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight!-imageTitleSpace/2, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight!-imageTitleSpace/2, left: -imageWidth!, bottom: 0, right: 0)
            break;
            
        case .Right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+imageTitleSpace/2, bottom: 0, right: -labelWidth-imageTitleSpace/2)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth!-imageTitleSpace/2, bottom: 0, right: imageWidth!+imageTitleSpace/2)
            break;
            
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
    }
}

extension UIButton {
    //倒计时
    func startWithTime(_ timeCount:Int, title:String, mColor:UIColor, color:UIColor) {
        var timeOut = timeCount
        let queue = DispatchQueue.main
        
        let timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
        timer.schedule(deadline: DispatchTime.now(), repeating: DispatchTimeInterval.seconds(1), leeway: DispatchTimeInterval.seconds(0))
        
        timer.setEventHandler {
            if (timeOut <= 0) {
                timer.cancel()
                DispatchQueue.main.async(execute: {
                    self.setTitle(title, for: .normal)
                    self.setTitleColor(mColor, for: .normal)
                    self.isEnabled = true
                })
            } else {
                let timeStr = "\(timeOut)s"
                DispatchQueue.main.async(execute: {
                    self.setTitle(timeStr, for: .normal)
                    self.setTitleColor(color, for: .normal)
                    self.isEnabled = false
                })
                timeOut -= 1
            }
        }
        
        timer.resume()
    }
    
}
