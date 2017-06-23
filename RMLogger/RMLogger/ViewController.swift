//
//  ViewController.swift
//  RMLogger
//
//  Created by Rahul Mane on 15/06/17.
//  Copyright © 2017 Rahul Mane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //print(" ✅ 🚫\u{001b}[fg255,0,0;rahul\u{001b}[;")
        //print("Hello CocoaPods".red)

        //print("Hello","asdad","ewqeqw","adsa",separator : "4",terminator :"3")

        let logger = RMLogger()
        
        while true {
            
        logger.log(info: "Hello")
        logger.log(warning: "This is warning")
        logger.log(debug: "This is debug message")
        logger.log(error: "This is revorable error")
        logger.log(critical: "Can't recover from this..")
            
        }
        
        //print("✅ : This is goof")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

