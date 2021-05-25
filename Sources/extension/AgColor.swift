//
//  AgColor.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/13.
//  Copyright © 2019 xyz. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    
    @objc static func colorWithRGBA(_ c:Float,a:Float) -> UIColor {
        return UIColor(_colorLiteralRed: c/255, green: c/255, blue: c/255, alpha: a)
    }
    
    @objc static func colorWithRGB(_ c:Float) -> UIColor {
        return UIColor(_colorLiteralRed: c/255, green: c/255, blue: c/255, alpha: 1)
    }
    
    @objc static func colorFromHex(_ hexValue: UInt) -> UIColor {
        return colorFromHex(hexValue,alpha: 1)
    }
    
    @objc static func colorFromHex(_ hexValue: UInt,alpha:Float) -> UIColor {
        return UIColor(
            red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    
    // MARK: - 基础色系
    
    
    /**
     app主色系
     */
    open class func baseColor() -> UIColor {
        return UIColor.colorFromHex(0xf9867f)
    }
    
    open class func baseGreenColor() -> UIColor {
        return UIColor.baseBlueColor()
    }
    
    open class func baseBlueColor() -> UIColor {
        return UIColor.colorFromHex(0x2a74f1)
    }
    
    /**
     基础背景颜色
     */
    open class func baseBackgroundColor() -> UIColor {
        return UIColor.colorFromHex(0xfafafa)
    }
    
    /**
     基础导航背景颜色
     */
    open class func baseNaviBackgroundColor() -> UIColor {
        return UIColor.white
    }
    
    /**
     基础导航Title颜色
     */
    open class func baseNaviTitleColor() -> UIColor {
        return UIColor.black
    }
    
    /**
     线条色值
     */
    open class func baseLineColor() -> UIColor{
        return UIColor.LineChartColor()
    }
    
    /**
     基础文本颜色
     */
    open class func baseTextColor() -> UIColor {
        return UIColor.colorFromHex(0xcfcfcf)
    }
    
    /**
     基础文本加强颜色
     */
    open class func baseTextStrongColor() -> UIColor {
        return UIColor.black
    }
    
    /**
     基础文本弱化颜色
     */
    open class func textColor(_ alpha: Float = 0.8) -> UIColor {
        return UIColor.colorFromHex(0x05061a, alpha: alpha)
    }
    
    open class func kbColor(_ alpha: Float = 1) -> UIColor {
        return UIColor.colorFromHex(0x333cff, alpha: alpha)
    }
    
    open class func grayColor(_ alpha: Float = 1) -> UIColor {
        return UIColor.colorFromHex(0xf5f6fa)
    }
    
    open class func grayBorderColor() -> UIColor {
        return UIColor.colorFromHex(0xe1e2ea)
    }

    open class func orderTextColor() -> UIColor {
        return UIColor.colorFromHex(0x666666)
    }
    
    open class func fillColor() -> UIColor {
        return UIColor.colorFromHex(0xd5d5d5)
    }
    
    open class func baseOrangeColor() -> UIColor {
        return UIColor.colorFromHex(0xf2a046)
    }
    
    open class func warningColor() -> UIColor {
        return UIColor.colorFromHex(0xfeecec)
    }
    
    open class func mainColor() -> UIColor {
        return UIColor.colorFromHex(0x0003FF)
    }
    
    open class func baseRedColor() -> UIColor {
        return UIColor.colorFromHex(0xdf454d)
    }
    
    open class func orangeColor() -> UIColor {
        return UIColor.colorFromHex(0xd35c4e)
    }

    open class func LineChartColor() -> UIColor {
        return UIColor.colorFromHex(0xe0e2ea)
    }
    
    open class func blueTextColor() -> UIColor {
        return UIColor.colorFromHex(0x3486f7)
    }
    
    open class func avaterColor() -> UIColor {
        return UIColor.colorFromHex(0x909cb4)
    }

    /// 删除颜色 
    open class func deleteColor() -> UIColor {
        return UIColor.colorFromHex(0xe25246)
    }
    
    /// tag颜色
    open class func tagColor() -> UIColor {
        return UIColor.colorFromHex(0x5343AA, alpha: 0.86)
    }
    
}

extension UIColor {
    var hexString:String? {
        if let components = self.cgColor.components {
            let r = components[0]
            let g = components[1]
            let b = components[2]
            return  String(format: "#%02x%02x%02x", (Int)(r * 255), (Int)(g * 255), (Int)(b * 255))
        }
        return nil
    }
    
    open class var randomColor:UIColor{
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
}
