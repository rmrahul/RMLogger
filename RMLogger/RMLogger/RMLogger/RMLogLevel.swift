//
//  RMLogLevel.swift
//  RMLogger
//
//  Created by Rahul Mane on 15/06/17.
//  Copyright © 2017 Rahul Mane. All rights reserved.
//

import UIKit


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
        return [RMLogVersionFormatter(),RMLogDeviceFormatter()]
    }

    internal var message: ()-> String

    internal var formattedMessage: String{
        var fMessage : String = message()
        for f in formatters{
            fMessage = f.formatMessage(fMessage)
        }
        return "\(description) \(prefix) \(fMessage) \(postfix)"
    }
}


