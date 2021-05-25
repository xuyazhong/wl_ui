//
//  AgString.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/18.
//  Copyright © 2019 xyz. All rights reserved.
//

import Foundation

extension String {
    
    func AgFormat(_ params: Int) -> String {
        let result = String(format: self, "\(params)")
        return result
    }
    
    func AgFormat(_ params: String) -> String {
        let result = String(format: self, params)
        return result
    }
    
    func AgFormat(_ v1: String, _ v2: String) -> String {
        let result = String(format: self, v1, v2)
        return result
    }
    
    func AgFormat(_ v1: String, _ v2: String, _ v3: String) -> String {
        let result = String(format: self, v1, v2, v3)
        return result
    }
    
    func AgFormat(_ v1: String, _ v2: String, _ v3: String, _ v4: String) -> String {
        let result = String(format: self, v1, v2, v3, v4)
        return result
    }
    
    func AgColor() -> UInt {
        let color_string = self.dropFirst(1)
        if let res = UInt(color_string, radix: 16) {
            return res
        }
        return 0xffffff
    }
    
    func AgSplit(_ key: String = ",") -> [String] {
        let agKey = Character(key)
        return split(separator: agKey).compactMap{"\($0)"}
    }
    
    func trim () -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
        
    func getSecretPhone () -> String {
        let name = self
        if (name.count == 11) {
            let startIndex = index(name.startIndex, offsetBy: 3)
            let endIndex = index(startIndex, offsetBy: 4)
            let result = replacingCharacters(in: startIndex..<endIndex, with: "****")
            return result
        }
        return name
    }
    
    func trimHTTP() -> String {
        var name = self
        name = name.replacingOccurrences(of: "http://", with: "")
        name = name.replacingOccurrences(of: "https://", with: "")
        return name
    }
    
    // base64编码
    func toBase64() -> String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }
    
    func addToken() -> String {
        if self.contains("?") {
            return "\(self)&TOKEN=\(BaseUserManager.sharedInstance.loginString)"
        }
        return "\(self)?TOKEN=\(BaseUserManager.sharedInstance.loginString)"
    }
    
    // jd URL
    func jdURL(merFlag: String) -> String {
    /// 如果是merFlag=JD的就是`http://img13.360buyimg.com/n1/${item.imagePath}`，如果是=MER的话。就什么都不加
        if merFlag == "JD" {
            return "http://img13.360buyimg.com/n1/\(self)"
        }
        return self
    }
    
    // base64解码
    func urlSafeBase64Decoded() -> String? {
        var st = self
            .replacingOccurrences(of: "_", with: "/")
            .replacingOccurrences(of: "-", with: "+")
        let remainder = self.count % 4
        if remainder > 0 {
            st = self.padding(toLength: self.count + 4 - remainder,
                              withPad: "=",
                              startingAt: 0)
        }
        guard let d = Data(base64Encoded: st, options: .ignoreUnknownCharacters) else{
            return nil
        }
        return String(data: d, encoding: .utf8)
    }
    
    func substring(beginIndex: Int = 0, toIndex: Int) -> String {
        
        let subStr = prefix(toIndex)
        return String(subStr)
        
    }
    
    func setMaxLength(_ maxLength: Int) -> String {
        if (self.count > maxLength) {
            return substring(toIndex: maxLength)
        }
        return self
    }
    
    func filterNumber() -> String {
        var array: [Character] = []
        _ = map { (item) in
            if (item >= "0" && item <= "9") {
                array.append(item)
            }
        }
        return String(array)
    }
    
    func filterTelNumber() -> String {
        var array: [Character] = []
        _ = map { (item) in
            if (item >= "0" && item <= "9") {
                array.append(item)
            } else if item == "-" {
                array.append(item)
            }
        }
        return String(array)
    }
    
    func filterNumberAndWord() -> String {
        var array: [Character] = []
        _ = map { (item) in
            if (item >= "0" && item <= "9") {
                array.append(item)
            } else if (item >= "a" && item <= "z") {
                array.append(item)
            } else if (item >= "A" && item <= "Z") {
                array.append(item)
            }
        }
        return String(array)
    }
    
    /// 是否是数字
    func isNumber() -> Bool {
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = self.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return self == numberFiltered
    }
    
    /// 是否是字母
    func isWords() -> Bool {
        let aSet = NSCharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").inverted
        let compSepByCharInSet = self.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return self == numberFiltered
    }
    
    /// 是否是字母和数字
    func isNumberWorder() -> Bool {
        let aSet = NSCharacterSet(charactersIn:"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").inverted
        let compSepByCharInSet = self.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return self == numberFiltered
    }

    ///验证邮箱
    func validateEmail() -> Bool {
        if self.count == 0 {
            return false
        }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    ///验证手机号
    func isPhoneNumber() -> Bool {
        if self.count == 0 {
            return false
        }
        let mobile = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$"
        let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        if regexMobile.evaluate(with: self) == true {
            return true
        } else {
            return false
        }
    }
    
    func urlencode() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    
    func urldecode() -> String {
        guard let url = self.removingPercentEncoding else {
            return self
        }
        return url
    }
    
    func isURL() -> Bool {
        if (self.count <= 9) {
            return false
        }
        if (self.hasPrefix("http://") || self.hasPrefix("https://")) {
            return true
        }
        return false
    }
    
    func getFileName() -> String? {
        let result = self.AgSplit("/")
        guard let name = result.last else {
            return nil
        }
        return name
    }
    
    func trimHTML_TAG() -> String {
        var normalStr = self
        print("### before => \(normalStr)")
        /// 判断字符串是否有效
        if normalStr.count == 0 {
            return ""
        }

        //过滤正常标签
        var regularExpression: NSRegularExpression? = nil
        do {
            regularExpression = try NSRegularExpression(pattern: "<[^>]*>", options: .caseInsensitive)
        } catch {
            print("##### failure")
        }
        if let res = regularExpression?.stringByReplacingMatches(in: normalStr, options: .reportProgress, range: NSRange(location: 0, length: normalStr.count), withTemplate: "") {
            normalStr = res
        }
        
        //过滤占位符
        var plExpression: NSRegularExpression? = nil
        do {
            plExpression = try NSRegularExpression(pattern: "&[^;]+;", options: .caseInsensitive)
        } catch {
            print("##### failure")
        }
        if let res = plExpression?.stringByReplacingMatches(in: normalStr, options: .reportProgress, range: NSRange(location: 0, length: normalStr.count), withTemplate: "") {
            normalStr = res
        }
        //过滤空格
        var spaceExpression: NSRegularExpression? = nil
        do {
            spaceExpression = try NSRegularExpression(pattern: "^\\s*|\\s*$", options: .caseInsensitive)
        } catch {
            print("##### failure")
        }
        if let res = spaceExpression?.stringByReplacingMatches(in: normalStr, options: .reportProgress, range: NSRange(location: 0, length: normalStr.count), withTemplate: "") {
            normalStr = res
        }
        print("### after => \(normalStr)")
        return normalStr
    }
    
    /*
//    #pragma mark - ============== 正则去除HTML标签 ==============
    + (NSString *)getNormalStringFilterHTMLString:(NSString *)htmlStr{
        NSString *normalStr = htmlStr.copy;
        //判断字符串是否有效
        if (!normalStr || normalStr.length == 0 || [normalStr isEqual:[NSNull null]]) return nil;
        
        //过滤正常标签
        NSRegularExpression *regularExpression=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>" options:NSRegularExpressionCaseInsensitive error:nil];
        normalStr = [regularExpression stringByReplacingMatchesInString:normalStr options:NSMatchingReportProgress range:NSMakeRange(0, normalStr.length) withTemplate:@""];
        
        //过滤占位符
        NSRegularExpression *plExpression=[NSRegularExpression regularExpressionWithPattern:@"&[^;]+;" options:NSRegularExpressionCaseInsensitive error:nil];
        normalStr = [plExpression stringByReplacingMatchesInString:normalStr options:NSMatchingReportProgress range:NSMakeRange(0, normalStr.length) withTemplate:@""];
        
        //过滤空格
        NSRegularExpression *spaceExpression=[NSRegularExpression regularExpressionWithPattern:@"^\\s*|\\s*$" options:NSRegularExpressionCaseInsensitive error:nil];
        normalStr = [spaceExpression stringByReplacingMatchesInString:normalStr options:NSMatchingReportProgress range:NSMakeRange(0, normalStr.length) withTemplate:@""];

        return normalStr;
    }
 */
    
}

