//
//  AgView.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/16.
//  Copyright © 2019 xyz. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func round (radius: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
    }
    
    func round (radius: CGFloat, bgColor: UIColor) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
        backgroundColor = bgColor
    }
    
    func round (radius: CGFloat, borderColor: UIColor) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
        layer.borderWidth = 1.0
        layer.borderColor = borderColor.cgColor
    }
    
    func round (radius: CGFloat, bgColor: UIColor, borderColor: UIColor) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
        layer.borderWidth = 1.0
        layer.borderColor = borderColor.cgColor
        backgroundColor = bgColor
    }
    
    func round (bgColor: UIColor, borderColor: UIColor) {
        layer.borderWidth = 1.0
        layer.borderColor = borderColor.cgColor
        backgroundColor = bgColor
    }
    
    func round(borderColor: UIColor) {
        layer.borderWidth = 1.0
        layer.borderColor = borderColor.cgColor
    }
    
    func Defaultborder() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.gray.cgColor
    }
    
}

extension UIView {
    
    /// 部分圆角
    ///
    /// - Parameters:
    ///   - radii: 圆角半径
    public func setTopCornerRadii(_ radii: CGFloat) {
        setCornerRadii(radii, corners: [.topLeft,.topRight])
    }
    
    /// 部分圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个
    ///   - radii: 圆角半径
    public func setCornerRadii(_ radii: CGFloat, corners: UIRectCorner) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
}
