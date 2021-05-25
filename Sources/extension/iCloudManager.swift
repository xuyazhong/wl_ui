//
//  iCloudManager.swift
//  kb
//
//  Created by xuyazhong on 2020/5/27.
//  Copyright © 2020 xyz. All rights reserved.
//

import UIKit

class iCloudManager: NSObject {

    typealias icloudBlock = ((Data) -> Void)
    
    static func iCloudEnable() -> Bool {
        let manager = FileManager.default
        let url = manager.url(forUbiquityContainerIdentifier: nil)
        if (url != nil) {
            return true
        }
        print("iCloud不可用")
        return false
    }

    static func downloadWithDocumentURL(url: URL, callBack: icloudBlock?) {
        let iCloudDocument = AgDocument(fileURL: url)
        iCloudDocument.open { (success) in
            if (success) {
                iCloudDocument.close { (finished) in
                    print("关闭成功")
                }
                if let block = callBack, let data = iCloudDocument.data {
                    block(data)
                }
            }
        }
    }

}
