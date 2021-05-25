//
//  AgString.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/17.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit
import Toast_Swift
import CYLTabBarController

@objc class AgUtils : NSObject {
    
    static public func createAttrText(_ text: String, _ color: UIColor) -> NSAttributedString {
        
        return NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
    static public func createAttrText(_ html: String) -> NSAttributedString? {
        guard let encodedData = html.data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: encodedData, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch  {
            return nil
        }
    }
    
    static public func createAttrText(_ img: UIImage, _ text: String, _ color: UIColor) -> NSAttributedString {
        let markAttribute = NSMutableAttributedString(string: " \(text)")
        
        let attr = [NSAttributedString.Key.font: UIFont.smallSecLevelFont(), NSAttributedString.Key.foregroundColor: color]
        markAttribute.addAttributes(attr, range: NSRange(location: 0, length: text.count))
        
        //以上是富文本显示
        let arkattch = NSTextAttachment() //定义一个attachment
        arkattch.image = UIImage(named: "jd")//初始化图片
        arkattch.bounds = CGRect(x: 0, y: -1, width: 46, height: 15) //初始化图片的 bounds
        let markattchStr = NSAttributedString(attachment: arkattch) // 将attachment  加入富文本中
        markAttribute.insert(markattchStr, at: 0)// 将markattchStr  加入原有文字的某个位置
        
        return markAttribute
    }
    
    static public func createAttrText(_ text: String, _ color: UIColor, _ font: UIFont) -> NSAttributedString {
        
        return NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font])
    }
    
    static public func createAttrTextUnderLine(_ text: String, _ color: UIColor, _ font: UIFont) -> NSAttributedString {
        
        return NSMutableAttributedString(string: text, attributes:
            [NSAttributedString.Key.foregroundColor: color,
             NSAttributedString.Key.font: font,
             NSAttributedString.Key.underlineColor: color,
             NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ])
    }
        
    static func writeDefaults(_ key:String, value:String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func readDefaults(_ key:String) -> String? {
        return UserDefaults.standard.object(forKey: key) as? String
    }
    
    static func deleteDefaults(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func writeObject(_ key:String, value: NSObject) {
        let modelData = NSKeyedArchiver.archivedData(withRootObject: value)
        UserDefaults.standard.set(modelData, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func readObject(_ key:String) -> NSObject? {
        guard let modelData = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        guard let modelObj: NSObject = NSKeyedUnarchiver.unarchiveObject(with: modelData) as? NSObject else {
            return nil
        }
        return modelObj
    }
    
    static func getUserInfo() {
        AgNet.API.netUserInfo { (response) in
            guard let result = QYResult<UserInfoData>.deserialize(from: response) else {
                return
            }
            guard let userinfo = result.data else {
                return
            }
            JPushManager.shared.setAlias(user_uuid: userinfo.uuid)
        } fail: { (errorResult) in
            
        }
    }
    
    @objc static func loginSuccess() {
        getUserInfo()
        let msg = BaseNavigation(rootViewController: MessageVC())
        let work = BaseNavigation(rootViewController: ConsoleVC())
        let list = BaseNavigation(rootViewController: MyEnterpriseListVC())
        let me = BaseNavigation(rootViewController: MeVC())
        let vcs = [msg, work, list, me]
        
        let msgItem = [CYLTabBarItemTitle:"消息", CYLTabBarItemImage:"msg", CYLTabBarItemSelectedImage:"msg_active"]
        let workItem = [CYLTabBarItemTitle:"工作台", CYLTabBarItemImage:"console", CYLTabBarItemSelectedImage:"console_active"]
        let listItem = [CYLTabBarItemTitle:"企业", CYLTabBarItemImage:"tongxunlu_en", CYLTabBarItemSelectedImage:"tongxunlu"]
        let meItem = [CYLTabBarItemTitle:"我的", CYLTabBarItemImage:"mine", CYLTabBarItemSelectedImage:"mine_active"]
        
        let tabAttrs = [msgItem, workItem, listItem, meItem]
        
        let root = BaseTabbar(viewControllers: vcs, tabBarItemsAttributes: tabAttrs, imageInsets: UIEdgeInsets(top: -1, left: 0, bottom: 1, right: 0), titlePositionAdjustment: UIOffset(horizontal: 0, vertical: -5))
        root.selectedIndex = 1
        let transtition = CATransition()
        transtition.duration = 0.5
        transtition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        let window = BaseConst.window
        window?.layer.add(transtition, forKey: "animation")
        window?.rootViewController = root
    }
    
    @objc static func logout () {
        User.logout()
        let login = BaseNavigation(rootViewController: LoginVC())
        let transtition = CATransition()
        transtition.duration = 0.5
        transtition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        let window = BaseConst.window
        window?.layer.add(transtition, forKey: "animation")
        window?.rootViewController = login
    }
    //    -(UIImage*)convertViewToImage:(UIView*)v{
    //    CGSize s = v.bounds.size;
    //    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    //    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    //    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    //    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    //    return image;
    //    }

    static func convertViewToImage(v: UIView) -> UIImage? {
        let s = v.bounds.size
        UIGraphicsBeginImageContextWithOptions(s, false, UIScreen.main.scale)
        v.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext() ?? nil
        UIGraphicsEndImageContext()
        return image
    }
    
    static func rotateImage(_ image: UIImage, withAngle angle: Double) -> UIImage? {
        if angle.truncatingRemainder(dividingBy: 360) == 0 { return image }
        let imageRect = CGRect(origin: .zero, size: image.size)
        let radian = CGFloat(angle / 180 * .pi)
        let rotatedTransform = CGAffineTransform.identity.rotated(by: radian)
        var rotatedRect = imageRect.applying(rotatedTransform)
        rotatedRect.origin.x = 0
        rotatedRect.origin.y = 0
        UIGraphicsBeginImageContext(rotatedRect.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.translateBy(x: rotatedRect.width / 2, y: rotatedRect.height / 2)
        context.rotate(by: radian)
        context.translateBy(x: -image.size.width / 2, y: -image.size.height / 2)
        image.draw(at: .zero)
        let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rotatedImage
    }
    
    static func convertViewAndRotate(v: UIView) -> UIImage? {
        let angle = 270.0
        let size = v.bounds.size
        let imageRect = CGRect(origin: .zero, size: size)
        let radian = CGFloat(angle / 180 * .pi)
        let rotatedTransform = CGAffineTransform.identity.rotated(by: radian)
        var rotatedRect = imageRect.applying(rotatedTransform)
        rotatedRect.origin.x = 0
        rotatedRect.origin.y = 0
        UIGraphicsBeginImageContext(rotatedRect.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.translateBy(x: rotatedRect.width / 2, y: rotatedRect.height / 2)
        context.rotate(by: radian)
        context.translateBy(x: -size.width / 2, y: -size.height / 2)
        v.draw(.zero)
        let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rotatedImage
    }
    
    // 设置渐变色
    static func setGradualChangColor(frame: CGRect, startColorString: UInt, endColorString: UInt) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = [UIColor.colorFromHex(startColorString).cgColor, UIColor.colorFromHex(endColorString).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.locations = [0,1]
        return gradientLayer
    }
    
    static func alertSetting () -> UIAlertController {
        let alertController = UIAlertController(
            title: "没有位置权限",
            message: "请在设置中授权位置服务",
            preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "打开设置", style: .default) { (action) in
            
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        return alertController
    }

    static func createTimer(_ block: (() -> Void)?) -> DispatchSourceTimer {
        let queue = DispatchQueue.main
        let timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
        timer.schedule(deadline: DispatchTime.now(), repeating: DispatchTimeInterval.seconds(1), leeway: DispatchTimeInterval.seconds(0))
        timer.setEventHandler(handler: block)
        return timer
    }
    
    static func createTimer(second: Int, block: (() -> Void)?) -> DispatchSourceTimer {
        let queue = DispatchQueue.main
        let timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
        timer.schedule(deadline: DispatchTime.now(), repeating: DispatchTimeInterval.seconds(second), leeway: DispatchTimeInterval.seconds(0))
        timer.setEventHandler(handler: block)
        return timer
    }
    
    static func delay(second: Double, block: @escaping (() -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: (.now()+second), execute: block)
    }
    
    static func formatDateComponents(_ ymd: DateComponents) -> String {
        let year = "\(ymd.year!)"
        let month = ymd.month! < 10 ? "0\(ymd.month!)" : "\(ymd.month!)"
        let day = ymd.day! < 10 ? "0\(ymd.day!)" : "\(ymd.day!)"
        
        let timeStr = "\(year)-\(month)-\(day)"
        return timeStr
    }
    
    static func formatymdhms(_ ymd: DateComponents) -> String {
        let year = "\(ymd.year!)"
        let month = ymd.month! < 10 ? "0\(ymd.month!)" : "\(ymd.month!)"
        let day = ymd.day! < 10 ? "0\(ymd.day!)" : "\(ymd.day!)"
        
        let hour = ymd.hour! < 10 ? "0\(ymd.hour!)" : "\(ymd.hour!)"
        let minus = ymd.minute! < 10 ? "0\(ymd.minute!)" : "\(ymd.minute!)"
        let sec = ymd.second! < 10 ? "0\(ymd.second!)" : "\(ymd.second!)"

        let timeStr = "\(year)-\(month)-\(day) \(hour):\(minus):\(sec)"
        return timeStr
    }
    
    static func getAlertController (title: String, msg: String? = nil, okBtn: String? = nil, cancelBtn: String? = nil, succAction: ((UIAlertAction) -> Void)? = nil, failAction: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: msg ?? "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelBtn ?? "取消", style: .cancel, handler: failAction)
        let openAction = UIAlertAction(title: okBtn ?? "确定", style: .default, handler: succAction)
        alertController.addAction(cancelAction)
        alertController.addAction(openAction)
        if #available(iOS 13.0, *) {
            alertController.overrideUserInterfaceStyle = .light
        }
        return alertController
    }
    
    static func getWeekDay(dateTime: String) -> String {
        let dateFmt = DateFormatter()
        dateFmt.dateFormat = "yyyy-MM-dd"
        let date = dateFmt.date(from: dateTime)
        let interval = Int(date!.timeIntervalSince1970)
        let days = Int(interval/86400) // 24*60*60
        let weekday = ((days + 5)%7+7)%7
        let weekDays = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
        return weekDays[weekday]
    }
    
    static func getTime(dateTime: String) -> Int {
        let dateFmt = DateFormatter()
        dateFmt.dateFormat = "yyyy-MM-dd"
        let date = dateFmt.date(from: dateTime)
        let interval = Int(date!.timeIntervalSince1970)
        let days = Int(interval/86400) // 24*60*60
        return days
    }
    
    static func getHMSTime(dateTime: String) -> Int {
        let dateFmt = DateFormatter()
        dateFmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFmt.date(from: dateTime)
        let interval = Int(date!.timeIntervalSince1970)
        let days = Int(interval/86400) // 24*60*60
        return days
    }
    
    static func formatTime(dateTime: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: dateTime)        
        return date?.toMMddHHmm() ?? "0:00"
    }
    
    static func formatDateTime(dateTime: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: dateTime)
        return date?.toMMdd() ?? "今天"
    }
    
    static func formatMMDDTime(dateTime: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: dateTime)
        return date?.toMMddDay() ?? "今天"
    }
    
    static func formatHHmmTime(dateTime: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: dateTime)
        return date?.toHHmm() ?? "今天"
    }
    
    static func getHtmlRequest (_ name: String) -> URLRequest {
        let path = Bundle.main.path(forResource: name, ofType: "html")
        let url = URL(fileURLWithPath: path!)
        let urlRequest = URLRequest(url: url)
        return urlRequest
    }
    
    /// MARK: - 根据后台时间戳返回几分钟前，几小时前，几天前
    static func updateTimeToCurrennTime(timeStamp: String) -> String {
        let dateFmt = DateFormatter()
        dateFmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let resultDate = dateFmt.date(from: timeStamp) else {
            return ""
        }
        let timeSta = resultDate.timeIntervalSince1970
        //获取当前的时间戳
        let currentTime = Date().timeIntervalSince1970
        //时间差
        let reduceTime: TimeInterval = currentTime - timeSta
        //时间差小于60秒
        if reduceTime < 60 {
            return "刚刚"
        }
        //时间差大于一分钟小于60分钟内
        let mins = Int(reduceTime / 60)
        if mins < 60 {
            return "\(mins)分钟前"
        }
        let hours = Int(reduceTime / 3600)
        if hours < 24 {
            return "\(hours)小时前"
        }
        let days = Int(reduceTime / 3600 / 24)
        if days < 30 {
            return "\(days)天前"
        }
        //不满足上述条件---或者是未来日期-----直接返回日期
        let date = NSDate(timeIntervalSince1970: timeSta)
        let dfmatter = DateFormatter()
        //yyyy-MM-dd HH:mm:ss
        dfmatter.dateFormat="yyyy年MM月dd日 HH:mm"
        return dfmatter.string(from: date as Date)
    }
    
    static func renderHTML (str: String) -> NSAttributedString {
        let data = str.data(using: .unicode, allowLossyConversion: true)
        let option = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
        do {
            let attr = try NSAttributedString(data: data!, options: option, documentAttributes: nil)
            return attr
        } catch {
            return NSAttributedString(string: str)
        }
    }
    
    static func isSupport(schemes: String) -> Bool {
        guard let newURL = URL(string: schemes) else {
            return false
        }
        return UIApplication.shared.canOpenURL(newURL)
    }
    
    static func open(schemes: String) {
        guard let newURL = URL(string: schemes) else {
            return
        }
        UIApplication.shared.open(newURL, options: [:]) { (isOK) in
            print("isok => \(isOK)")
        }
        
    }
    
    static func Notification_post(name: String, object: Any?, userInfo: [AnyHashable : Any]? = nil) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: name), object: object, userInfo: userInfo)
    }
    
    static func Notification_addObserver(_ observer: Any, selector aSelector: Selector, name aName: String, object anObject: Any? = nil) {
        
        NotificationCenter.default.addObserver(observer, selector: aSelector, name: NSNotification.Name(rawValue: aName), object: anObject)
    }
    
    static func Notification_removeObserver(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    static func qy_price(_ price: Double) -> String {
        return String(format: "%.2f", price)
    }
    
    static func timeUnit(_ text: String) -> String {        
        if text == "0" {
            return "月"
        }
        if text == "1" {
            return "季度"
        }
        if text == "2" {
            return "年"
        }
        if text == "3" {
            return "天"
        }
        return ""
    }
    
    static func checkURL(_ url: String) -> String {
        if (url.contains("http://")) {
            return url
        }
        if url.contains("htts://") {
            return url
        }
        return "http://\(url)"
    }
    
    @objc static func formatHTML(_ html: String) -> String {
        let result = """
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset=utf-8>
        <meta name=viewport content=\"width=device-width,initial-scale=1,maximum-scale=1,user-scalable=0,user-scalable=no,minimal-ui\">
        <title>知识汇</title>
        <style>
            img {
                width: 100%
            }
        </style>
        </head>
        <body>
        <div style='width: 100%'>
        \(html)
        </div>
        </body>
        </html>
        """
        print("result => \(result)")
        return result
    }
    
    static func formatNormalHTML(_ html: String) -> String {
        let result = """
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset=utf-8>
        <meta name=viewport content=\"width=device-width,initial-scale=1,maximum-scale=1,user-scalable=0,user-scalable=no,minimal-ui\">
        <title>企业OS</title>
        <style>
            
        </style>
        </head>
        <body>
        <div style='width: 100%'>
        \(html)
        </div>
        </body>
        </html>
        """
        return result
    }
    
    // 校验身份证号码
    static func checkIsIdentityCard(_ identityCard: String) -> Bool {
        //判断是否为空
        if identityCard.count <= 0 {
            return false
        }
        //判断是否是18位，末尾是否是x
        let regex2: String = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        let identityCardPredicate = NSPredicate(format: "SELF MATCHES %@", regex2)
        if !identityCardPredicate.evaluate(with: identityCard) {
            return false
        }
        //判断生日是否合法
        let range = NSRange(location: 6, length: 8)
        let datestr: String = (identityCard as NSString).substring(with: range)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        if formatter.date(from: datestr) == nil {
            return false
        }
        //判断校验位
        if identityCard.count == 18 {
            let idCardWi: [String] = ["7", "9", "10", "5", "8", "4", "2", "1", "6", "3", "7", "9", "10", "5", "8", "4", "2"]
            //将前17位加权因子保存在数组里
            let idCardY: [String] = ["1", "0", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
            //这是除以11后，可能产生的11位余数、验证码，也保存成数组
            var idCardWiSum: Int = 0
            //用来保存前17位各自乖以加权因子后的总和
            for i in 0..<17 {
                idCardWiSum += Int((identityCard as NSString).substring(with: NSRange(location: i, length: 1)))! * Int(idCardWi[i])!
            }
            let idCardMod: Int = idCardWiSum % 11
            //计算出校验码所在数组的位置
            let idCardLast: String = String(identityCard.suffix(1))
            //得到最后一位身份证号码
            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
            print("last => \(idCardLast)")
            if idCardMod == 2 {
                if idCardLast == "X" || idCardLast == "x" {
                    return true
                } else {
                    return false
                }
            } else {
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                if (idCardLast as NSString).integerValue == Int(idCardY[idCardMod]) {
                    return true
                } else {
                    return false
                }
            }
        }
        return false
    }
    
    static var topViewController: UIViewController? {
        var vc = UIApplication.shared.keyWindow?.rootViewController
        while let presentedVC = vc?.presentedViewController {
            vc = presentedVC
        }
        return vc
    }
    
    static func toast(_ text: String) {
        AgUtils.getWindows().makeToast(text, duration: 3.0, position: .center)
    }
    
    static func showWebVC(_ webUrl: String? = nil) {
        let viewController = ShowWebView()
        if let url = webUrl {
            viewController.webURL = url
        }
        guard let vc = BaseAppManager.getTopViewController() else {
            AgUtils.toast("没有top vc")
            return
        }
        vc.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    static func pushTo(_ viewController: UIViewController) {
        guard let vc = BaseAppManager.getTopViewController() else {
            AgUtils.toast("没有top vc")
            return
        }
        vc.navigationController?.pushViewController(viewController, animated: true)
    }
    
    static func getWindows() -> UIWindow {
        for itemWindow in UIApplication.shared.windows {
            if let cls = NSClassFromString("UIRemoteKeyboardWindow") {
                if itemWindow.isKind(of: cls) {
                    print("itemWindow => \(itemWindow)")
                    return itemWindow
                }
            }
            
        }
        return UIApplication.shared.keyWindow!
    }
    
    static func calcImageWidth(_ img_size: CGSize, imageHeight: CGFloat) -> CGFloat {
        
        let w = imageHeight/img_size.height*img_size.width
        
        return w
        
    }
    
    static func imageBrowser(urls: [String], index: Int) {
        
        var array: [YBIBImageData] = []
        
        for url in urls {
            if let img_url = URL(string: url) {
                let data = YBIBImageData()
                let layout = YBIBImageLayout()
                layout.verticalFillType = .fullWidth
                data.layout = layout
                data.imageURL = img_url
                array.append(data)
            }
        }
        
        let browser = YBImageBrowser()
        browser.dataSourceArray = array
        browser.currentPage = index
        browser.defaultToolViewHandler?.topView.operationButton.isHidden = true
        browser.show()
    }
    
    static func msgGetTitle(_ type: String) -> String {
        if type == "1" {
            return "系统消息"
        }
        if type == "2" {
            return "广场"
        }
        if type == "3" {
            return "成员邀请"
        }
        return ""
    }
    
    static func msgGetImage(_ type: String) -> UIImage {
        if type == "1" {
            return #imageLiteral(resourceName: "xitong")
        }
        if type == "2" {
            return #imageLiteral(resourceName: "yytz")
        }
        if type == "3" {
            return #imageLiteral(resourceName: "yqtz")
        }
        return #imageLiteral(resourceName: "logo")
    }
    
    static func getTextFieldAlert(title: String, value: String, place: String, block: ((String) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = place
            textField.text = value
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel) { (action) in
            
        }
        alert.addAction(cancel)
        let confirm = UIAlertAction(title: "确定", style: .default) { (action) in
            if let tf = alert.textFields?.first {
                block?(tf.text!)
            }
        }
        alert.addAction(confirm)
        return alert
    }
    
    static func actionAddDept(vc: BaseVC, parentId: String, uuid: String, success: QYBlock?) {
        let alert = AgUtils.getTextFieldAlert(title: "创建部门", value: "新部门", place: "请输入部门名称", block: { (res) in
            AgUtils.realAddDept(name: res, parentId: parentId, enter_uuid: uuid, cb: success)
        })
        vc.presentTo(viewController: alert)
    }
    
    static func realAddDept(name: String, parentId: String, enter_uuid: String, cb: QYBlock?) {
        
        let req = AddDeptReq()
        req.parentUuid = parentId
        req.name = name
        req.orgUuid = enter_uuid
        
        AgNet.API.netDeptAdd(para: req) { (response) in
            guard let result = QYResponse.deserialize(from: response) else {
                return
            }
            if result.isSuccess() {
                cb?()
            } else {
                AgUtils.toast(result.msg)
            }
        } fail: { (errorResult) in
            AgUtils.toast(errorResult.msg)
        }
    }
    
    static func uploadImages(_ img: Data, block: ((String) -> Void)?) {
        AgNet.API.netuploadImage(img) { (response) in
            guard let result = QYResultString.deserialize(from: response), let img_url = result.data else {
                return
            }
            if result.isSuccess() {
                block?(img_url)
            } else {
                AgUtils.toast(result.msg)
            }
        } fail: { (errorResult) in
            AgUtils.toast(errorResult.msg)
        }
    }
    
}
