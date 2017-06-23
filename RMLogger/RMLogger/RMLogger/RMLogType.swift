//
//  RMLogType.swift
//  RMLogger
//
//  Created by Rahul Mane on 15/06/17.
//  Copyright © 2017 Rahul Mane. All rights reserved.
//

import UIKit

protocol RMLogType {
    var message : ()-> String{get}
    var description : String {get}
    var prefix : String {get}
    var postfix : String {get}
    var formatters : [RMLogFormatter] {get}
    var formattedMessage : String{get}
}
