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
    var resultArray: [Memo] = []
    let realm = try! Realm()
    
    func addPostCollection(memo: Memo) {
        try! realm.write({ () in
            realm.add(memo)
            self.memos.insert(memo, atIndex: 0)
        })
    }
    
    func fetchPosts(){
    let allMemos = realm.objects(Memo)
        for oneMemo in allMemos {
            let memo = Memo()
            memo.text = oneMemo["text"] as! String
            memo.date = oneMemo["date"] as! String
            self.memos.insert(oneMemo, atIndex: 0)
        }
    }
    
    func searchPosts(searchText: String){
        resultArray.removeAll()
        let results = realm.objects(Memo).filter("text contents '\(searchText)'")
        for result in results {
            let memo = Memo()
            memo.text = result["text"] as! String
            memo.date = result["date"] as! String
            resultArray.insert(memo, atIndex: 0)
        }
    }
}
