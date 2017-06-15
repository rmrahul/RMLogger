//
//  RMLogLevel.swift
//  RMLogger
//
//  Created by Rahul Mane on 15/06/17.
//  Copyright © 2017 Rahul Mane. All rights reserved.
//

import UIKit


protocol RMLogFormatter {
    func formatMessage(_ message: String) -> String
}

enum RMLogLevel {
    case info
    case debug
    case error
}

protocol RMLogType {
    var message : String{get}
    var description : String {get}
    var prefix : String {get}
    var postfix : String {get}
    var formatters : [RMLogFormatter] {get}
    var formattedMessage : String{get}
}


struct RMLogInfoType : RMLogType{

    internal var description: String {
        return "✅"
    }
    
    internal var prefix: String {
        return ""
    }
    
    internal var postfix: String {
        return ":"
    }
    
    internal var formatters: [RMLogFormatter] {
        return [RMLogDeviceFormatter(),RMLogVersionFormatter()]
    }

    internal var message: String

    internal var formattedMessage: String{
        var fMessage : String = message
        for f in formatters{
            fMessage = f.formatMessage(fMessage)
        }
        return "\(description) \(prefix) \(fMessage) \(postfix)"
    }
}


class RMLogDeviceFormatter : RMLogFormatter{
    func formatMessage(_ message: String) -> String {
        return "iPhone : " + message
    }
}

class RMLogVersionFormatter : RMLogFormatter{
    func formatMessage(_ message: String) -> String {
        return "OS version : " + message
    }
}
