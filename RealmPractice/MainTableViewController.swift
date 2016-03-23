//
//  MainTableViewController.swift
//  RealmPractice
//
//  Created by 小菅仁士 on 2016/03/21.
//  Copyright © 2016年 kosuge satoshi. All rights reserved.
//

import UIKit
import RealmSwift

class MainTableViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    
    
    let memoManager = MemoManager.sharedInstance
    var currentDateTime = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        textField.delegate = self
        makeTapGesture()
        
        let realm = try! Realm()
        print(realm.path)
        memoManager.fetchPosts()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memoManager.memos.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemoCell", forIndexPath: indexPath)
        let memo = self.memoManager.memos[indexPath.row]
        cell.textLabel!.text = memo.text
        cell.detailTextLabel!.text = memo.date
        return cell
    }
    
    //MARK: -Action
    func makeTapGesture(){
        let tapRecogniser = UITapGestureRecognizer(target: self, action: "tap:")
        self.view.addGestureRecognizer(tapRecogniser)
    }
    func tap(sender:UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    func getNowDate() -> String {
        let now = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.stringFromDate(now)
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        currentDateTime = getNowDate()
        if textField.text!.isEmpty {
            print("テキスト空")
        } else {
            let memo = Memo(text: textField.text!, date: currentDateTime)
            memoManager.addPostCollection(memo)
            tableView.reloadData()
            textField.text = ""
        }
        return true
    }
}