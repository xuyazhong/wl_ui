//
//  MixString.swift
//  kb
//
//  Created by xuyazhong on 2020/7/23.
//  Copyright © 2020 xyz. All rights reserved.
//

import UIKit

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont = .mainFont()) -> CGFloat {
        let textHeight = NSString(string: self).boundingRect(with:
            CGSize(width: width,
            height: CGFloat.infinity),
            options: [.usesFontLeading, .usesLineFragmentOrigin],
            attributes: [NSAttributedString.Key.font : font],
            context: nil).size.height
        return CGFloat(ceilf(Float(textHeight)))
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont = .mainFont()) -> CGFloat {
        let textWidth = NSString(string: self).boundingRect(with: CGSize(width: CGFloat.infinity, height: height), options: [.usesFontLeading, .usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font : font], context: nil).size.width
        return CGFloat(ceilf(Float(textWidth)))
    }
}
