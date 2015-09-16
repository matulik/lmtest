//
//  MenuViewController.swift
//  lmtest
//
//  Created by CS_praktykant on 15/09/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var textEdit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changeButtonPressed(sender: AnyObject) {
        let sendText = ["text": self.textEdit.text]
        NSNotificationCenter.defaultCenter().postNotificationName("menuNotification", object: nil, userInfo: sendText)
    }
}
