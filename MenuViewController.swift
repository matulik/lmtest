//
//  MenuViewController.swift
//  lmtest
//
//  Created by CS_praktykant on 15/09/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var testTableView: UITableView!
    var content = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "addContentItem:", name: "textLabelNotification", object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //        var rowData = ["label1": self.content[indexPath.row][0], "label2": self.content[indexPath.row][1], "row": indexPath.row]
        let label1 = self.content[indexPath.row][0]
        let label2 = self.content[indexPath.row][1]
        let row = String(indexPath.row)
        var data = ["label1": label1, "label2": label2, "row": row]
        NSNotificationCenter.defaultCenter().postNotificationName("rowSelected", object: nil, userInfo: data)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.testTableView.dequeueReusableCellWithIdentifier("cell") as! TestTableViewCell
        cell.titleLabel!.text = self.content[indexPath.row][0]
        cell.descLabel!.text = self.content[indexPath.row][1]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.content.count
    }
    
    func addContentItem(notification: NSNotification) {
        let text = notification.userInfo!["label1"] as! String
        let desc = notification.userInfo!["label2"] as! String
        if let row_s = notification.userInfo!["row"] as? String {
            let row = row_s.toInt()
            if row >= 0 {
                self.content[row!][0] = text
                self.content[row!][1] = desc
                self.testTableView.reloadData()
            }
            return
        }
        else {
            self.content.append(Array(count: 2, repeatedValue: ""))
            self.content[self.content.count-1][0] = text
            self.content[self.content.count-1][1] = desc
            self.testTableView.reloadData()
            println(content.count)
        }
    }
}
