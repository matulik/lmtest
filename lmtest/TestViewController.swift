//
//  TestViewController.swift
//  lmtest
//
//  Created by CS_praktykant on 15/09/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var textLabel: UILabel! = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Slide-menu
        if self.revealViewController() != nil {
            self.menuButton.target = self.revealViewController()
            self.menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        // 
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changeTextHandler:", name: "menuNotification", object: nil)
    }
    
    func changeTextHandler(notification: NSNotification) {
        let text = notification.userInfo!["text"] as! String
        self.textLabel.text = text
    }
}
