//
//  RMLogger.swift
//  RMLogger
//
//  Created by Rahul Mane on 15/06/17.
//  Copyright © 2017 Rahul Mane. All rights reserved.
//

import UIKit

class RMLogger: NSObject {
    private let configuration : RMLogConfiguration
    
    init(configuration : RMLogConfiguration = RMLogConfiguration.defaultConfiguration()) {
        self.configuration = configuration
    }
    
    func log(categories: RMLogCategory...,message : @autoclosure ()-> String , separator: String = ":", terminator: String = " "){
        print("asd","sad","asd",separator : separator,terminator : terminator)
    }
}
