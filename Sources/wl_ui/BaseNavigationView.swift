//
//  BaseNavigationView.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/13.
//  Copyright © 2019 xyz. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class BaseNavigationView : UIView {
    /**
     左侧按钮
     */
    var leftButton: UIButton?
    
    /**
     右侧按钮
     */
    var rightButton: UIButton?
    
    /**
     title视图
     */
    var titleView: UIView? {
        didSet{
            if let resultView = titleView {
                addSubview(resultView)
            }
        }
    }
    
    /**
     title
     */
    var titleLabel: BaseLabel?
    
    /**
     导航标题
     */
    var title: String?{
        didSet{
            titleLabel?.text = title
        }
    }
    
    /**
     导航隐形线
     */
    lazy var shadowLineView: BaseLineView = {
        var shadowLineView = BaseLineView()
        return shadowLineView
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        titleView = getTitleView()
        if titleView != nil {
            addSubview(titleView!)
        }
        addSubview(shadowLineView)
        shadowLineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(BaseConst.DefaultLineHeight)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     设置左侧返回
     */
    open func setLeftBackButton() {
        setLeftButton(image: UIImage(named: "back"))
    }
    open func setRightButton() {
        setupRightButton()
    }
    
    /**
     设置左侧Present返回
     */
    open func setLeftCloseButton(){
        setLeftButton(image: UIImage(named: "back"))
    }
    
    /**
     设置左侧文案
     */
    func setLeftButton(text: String?) -> Void {
        setupLeftButton()
        setButton(button: leftButton, text: text)
    }
    
    /**
     设置右侧文案
     */
    func setRightButton(text: String?) -> Void {
        setupRightButton()
        rightButton?.right()
        setButton(button: rightButton, text: text)
    }
    
    /**
     设置左侧图片
     */
    func setLeftButton(image: UIImage?) -> Void{
        setupLeftButton()
        setButton(button: leftButton, image: image)
    }
    
    /**
     左侧按钮初始化
     */
    private func setupLeftButton() -> Void{
        if leftButton == nil{
            leftButton = UIButton()
            addSubview(leftButton!)
        }
    }
    
    /**
     左侧按钮初始化
     */
    private func setupRightButton() -> Void{
        if rightButton == nil {
            rightButton = UIButton()
            addSubview(rightButton!)
        }
    }

    /**
     设置左侧图片
     */
    func setRightButton(image: UIImage?) -> Void{
        setupRightButton()
        setButton(button: rightButton, image: image)
    }
    
    /**
     设置按钮文案
     */
    func setButton(button: UIButton?, text: String?){
        if let resultButton = button {
            resultButton.setTitle(text, for: .normal)
            resultButton.setTitle(text, for: .highlighted)
            resultButton.setTitleColor(UIColor.baseNaviBackgroundColor(), for: .normal)
            resultButton.setTitleColor(UIColor.baseNaviBackgroundColor(), for: .highlighted)
            resultButton.setTitleColor(UIColor.colorFromHex(0x9B9B9B), for: .disabled)
            resultButton.titleLabel?.font = UIFont.mainFont()
        }
    }
    
    /**
     设置按钮图片
     */
    func setButton(button: UIButton?, image: UIImage?) -> Void {
        if let resultButton = button {
            resultButton.setImage(image, for: UIControl.State.normal)
            resultButton.setImage(image, for: UIControl.State.highlighted)
        }
    }
    
    /**
     获取标题视图
     */
    func getTitleView() -> UIView? {
        titleLabel = BaseLabel()
        titleLabel!.font = UIFont.bigSecondLevelFont()
        titleLabel!.textColor = UIColor.baseNaviTitleColor()
        return titleLabel
    }
    
    /**
     设置布局
     */
    open func setupSubViewsSnp() -> Void {
        if leftButton != nil {
            leftButton!.snp.remakeConstraints { (make) in
                make.left.equalTo(6)
                make.bottom.equalTo(0)
                make.height.equalTo(BaseConst.DefaultNaviHeight)
                make.width.greaterThanOrEqualTo(BaseConst.DefaultNaviHeight)
            }
        }
        
        if rightButton != nil {
            rightButton!.snp.remakeConstraints { (make) in
                make.right.equalTo(-BaseConst.DefaultCellMargin)
                make.bottom.equalTo(-5)
                make.height.equalTo(30)
                make.width.greaterThanOrEqualTo(BaseConst.DefaultNaviHeight)
            }
        }
        
        if titleView != nil {
            titleView!.snp.remakeConstraints({ (make) in
                make.centerX.equalTo(self.snp.centerX)
                make.bottom.equalTo(0)
                make.height.equalTo(BaseConst.DefaultNaviHeight)
                make.left.greaterThanOrEqualTo(BaseConst.DefaultNaviHeight)
                if leftButton != nil {
                    make.left.greaterThanOrEqualTo(leftButton!.snp.right)
                }
                make.right.lessThanOrEqualTo(-BaseConst.DefaultNaviHeight)
                if rightButton != nil {
                    make.right.lessThanOrEqualTo(rightButton!.snp.left)
                }
            })
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        setupSubViewsSnp()
    }
    
}
