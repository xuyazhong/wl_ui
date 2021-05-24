//
//  BaseTextField.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/16.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit

class BaseTextField: UITextField {
    
    var textValue: String {
        set {
            text = newValue
        }
        get {
            return text!
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = UIColor.black
        font = UIFont.bigFirstLevelFont()
        autocorrectionType = .no
        autocapitalizationType = .none
        clearButtonMode = .whileEditing
    }
    
    func setPlaceholder(text: String) {
        setPlaceholder(text: text, color: UIColor.baseTextColor())
    }

    func setPlaceholder(text: String, color: UIColor) {
        setPlaceholder(text: text, color: color, font: UIFont.mainFont())
    }
    
    func setPlaceholder(text: String, color: UIColor, font: UIFont) {
        let placeholderText = NSAttributedString(string: text, attributes: [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: font
        ])
        attributedPlaceholder = placeholderText
        self.font = font
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
