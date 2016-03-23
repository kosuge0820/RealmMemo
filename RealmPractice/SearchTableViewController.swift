//
//  SearchTableViewController.swift
//  RealmPractice
//
//  Created by 小菅仁士 on 2016/03/21.
//  Copyright © 2016年 kosuge satoshi. All rights reserved.
//

import UIKit
import RealmSwift

class SearchTableViewController: UITableViewController, UITextFieldDelegate{
    @IBOutlet weak var textField: UITextField!
    
    let memoManager = MemoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        makeTapGesture()
        textField.becomeFirstResponder()
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemoCell", forIndexPath: indexPath)
        return cell
    }
    
    //MARK: -Action
    @IBAction func tapStopButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func makeTapGesture(){
        let tapRecogniser = UITapGestureRecognizer(target: self, action: "tap:")
        self.view.addGestureRecognizer(tapRecogniser)
    }
    func tap(sender:UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}