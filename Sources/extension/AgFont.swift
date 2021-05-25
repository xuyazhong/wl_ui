//
//  AgFont.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/13.
//  Copyright © 2019 xyz. All rights reserved.
//

import Foundation
import UIKit
extension UIFont {
    /**
     默认系统字体大小
     - returns: font
     */
    public class func hunterSystemFont() -> UIFont{
        return  .systemFont(ofSize: UIFont.systemFontSize)
    }
    
    /**
    Small字体
     
     - returns: font
     */
    public class func hunterSmallSystemFont() -> UIFont{
        return  .systemFont(ofSize: UIFont.smallSystemFontSize)
    }
    
    /**
    UIFont字体
     
     - returns: font
     */
    public class func hunterBoldSystemFont() -> UIFont{
        return UIFont.boldSystemFont(ofSize: UIFont.smallSystemFontSize)
    }
    
    public class func hunterSystemFont14() -> UIFont{
        return .hunterSystemFontSize(14)
    }
    
    public class func hunterSystemFont13() -> UIFont{
        return .hunterSystemFontSize(13)
    }
    
    public class func hunterSystemFont12() -> UIFont{
        return .hunterSystemFontSize(12)
    }
    
    public class func hunterSystemFont11() -> UIFont{
        return .hunterSystemFontSize(11)
    }
    
    public class func hunterSystemFont10() -> UIFont{
        return .hunterSystemFontSize(10)
    }
    
    public class func hunterSystemFont17() -> UIFont{
        return .hunterSystemFontSize(17)
    }
    
    public class func hunterSystemFontSize(_ size: CGFloat) -> UIFont{
        return .systemFont(ofSize: size)
    }
    
    public class func hunterBoldSystemFont17() -> UIFont{
        return .hunterBoldSystemFontSize(17)
    }
    
    public class func hunterBoldSystemFontSize(_ size: CGFloat) -> UIFont{
        return .boldSystemFont(ofSize: size)
    }
    
    public class func moneyRegularFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "KozGoPr6N-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public class func moneyMediumFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "KozGoPr6N-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public class func moneyBoldFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "KozGoPr6N-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    public class func appleRegularFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public class func appleThinFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Thin", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public class func appleMediumFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public class func appleSemiboldFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Semibold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    // MARK: - 字号
    
    open class func bigFourthFont() -> UIFont {
        return UIFont.systemFont(ofSize: 26)
    }
    
    /**
     字号级别 大三
     */
    open class func bigThirdFont() -> UIFont {
        return UIFont.systemFont(ofSize: 20)
    }
    
    /**
     字号级别 大二
     */
    open class func bigSecondLevelFont() -> UIFont {
        return UIFont.systemFont(ofSize: 18)
    }
    
    /**
     字号级别 大一
     */
    open class func bigFirstLevelFont() -> UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    /**
     字号级别 主字号
     */
    open class func mainFont() -> UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    
    // MARK: - 字号
    open class func titleFont() -> UIFont {
        return UIFont.boldSystemFont(ofSize: 16)
    }
    
    // MARK: - 字号
    open class func navTitleFont() -> UIFont {
        return UIFont.hunterBoldSystemFontSize(18)
    }
    
    /**
     字号级别 小一
     */
    open class func smallFisrtLevelFont() -> UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
    
    /**
     字号级别 小2
     */
    open class func smallSecLevelFont() -> UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    
    public class func FjallFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "FjallaOne-Regular", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
}
