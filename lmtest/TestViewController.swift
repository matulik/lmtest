//
//  TestViewController.swift
//  lmtest
//
//  Created by CS_praktykant on 15/09/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var textLabel1: UITextField!
    @IBOutlet weak var textLabel2: UITextField!

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var row : Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Slide-menu
        if self.revealViewController() != nil {
            self.menuButton.target = self.revealViewController()
            self.menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        //
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "rowSelected:", name: "rowSelected", object: nil)
        
    }
    @IBAction func addButtonPressed(sender: AnyObject) {
        if row >= 0 {
            let textUserInfo = ["label1": self.textLabel1.text, "label2": self.textLabel2.text, "row": String(self.row)]
            NSNotificationCenter.defaultCenter().postNotificationName("textLabelNotification", object: nil, userInfo: textUserInfo)
            return
        }
        let textUserInfo = ["label1": self.textLabel1.text, "label2": self.textLabel2.text]
        NSNotificationCenter.defaultCenter().postNotificationName("textLabelNotification", object: nil, userInfo: textUserInfo)
    }
    
    func rowSelected(notification: NSNotification) {
        let row_s = notification.userInfo!["row"] as! String
        self.row = row_s.toInt()!
        self.textLabel1.text = notification.userInfo!["label1"] as! String
        self.textLabel2.text = notification.userInfo!["label2"] as! String
    }
}
