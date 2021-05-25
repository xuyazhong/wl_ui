//
//  AgDocument.swift
//  kb
//
//  Created by xuyazhong on 2020/5/27.
//  Copyright © 2020 xyz. All rights reserved.
//

import UIKit

class AgDocument: UIDocument {

    var data: Data?
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        if let d = contents as? Data {
            self.data = d
        }
    }
}
