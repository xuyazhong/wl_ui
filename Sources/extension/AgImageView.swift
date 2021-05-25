//
//  AgImageView.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/27.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit

extension UIImageView {

    func ag_setImageURL(_ url:String?, placeholderURL:String? = nil) {
        let ft_url = url ?? ""
        let place_url = placeholderURL ?? "AppIcon"
        
        sd_setImage(with: URL(string: ft_url), placeholderImage: UIImage(named: place_url))
        
    }
    
    func ag_setImageURL(_ url:String?) {
        guard let imgUrl = url else {
            image = UIImage(named: "AppIcon")
            return
        }
        sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: "AppIcon"))
    }

}
