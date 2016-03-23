//
//  MemoManager.swift
//  RealmPractice
//
//  Created by 小菅仁士 on 2016/03/21.
//  Copyright © 2016年 kosuge satoshi. All rights reserved.
//

import UIKit
import RealmSwift

class MemoManager: NSObject {

    static let sharedInstance = MemoManager()
    var memos: [Memo] = []
}
