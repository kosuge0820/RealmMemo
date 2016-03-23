//
//  Memo.swift
//  RealmPractice
//
//  Created by 小菅仁士 on 2016/03/21.
//  Copyright © 2016年 kosuge satoshi. All rights reserved.
//

import Foundation
import RealmSwift

class Memo: Object {
    
    dynamic var text = ""
    dynamic var date = ""
    
    convenience init(text: String, date: String) {
        self.init()
        self.text = text
        self.date = date
    }
}