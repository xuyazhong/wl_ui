//
//  BaseImageView.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/30.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit

class BaseImageView: UIImageView {

    override init(image: UIImage?) {
        super.init(image: image)
    }

    override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = ContentMode.scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
