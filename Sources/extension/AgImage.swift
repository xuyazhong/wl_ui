//
//  AgImage.swift
//  Agriculture
//
//  Created by xuyazhong on 2019/4/24.
//  Copyright © 2019 xyz. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    public func imageRotatedByDegrees() -> UIImage? {
        let portraitImage  : UIImage? = UIImage(cgImage: self.cgImage! ,
                                               scale: 1.0 ,
                                               orientation: UIImage.Orientation.left)
        return portraitImage
    }
//    - (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size {
//        CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
//        UIGraphicsBeginImageContext(rect.size);
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        CGContextSetFillColorWithColor(context, [color CGColor]);
//        CGContextFillRect(context, rect);
//        UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        return theImage;
//    }
    
    static func createImage(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage

    }
    
    static func base64(_ imgStr: String) -> UIImage? {
        if imgStr.count == 0 {
            print("errot")
            return nil
        }
        if let url = URL(string: imgStr),let data = try? Data(contentsOf: url),let image = UIImage(data: data) {
            return image
        }

        return nil

    }

}
