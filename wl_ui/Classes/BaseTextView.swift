//
//  BaseTextView.swift
//  kb
//
//  Created by xuyazhong on 2020/6/5.
//  Copyright © 2020 xyz. All rights reserved.
//

import UIKit

class BaseTextView: UIView {
    
    lazy var textView: UITextView = {
        var textView: UITextView = UITextView()
        textView.textColor = UIColor.black
//        textView.placeholderColor = .orderTextColor()
        textView.backgroundColor = .grayColor(0.8)
        textView.font = .mainFont()
        return textView
    }()
    lazy var bgView: UIView = {
        var bgView: UIView = UIView()
        return bgView
    }()
    
    var inputValue: String {
        set {
            textView.text = newValue
        }
        get {
            return textView.text!
        }
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
//        textView.attributedPlaceholder = placeholderText
        textView.font = font
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bgView)
        bgView.addSubview(textView)
        
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        let edge = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        textView.snp.makeConstraints { (make) in
            make.edges.equalTo(edge)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
