//
//  RMLogLevel.swift
//  RMLogger
//
//  Created by Rahul Mane on 15/06/17.
//  Copyright © 2017 Rahul Mane. All rights reserved.
//

import UIKit

protocol RMLogAdjuster {
    func adjustMessage(_ message: String) -> String
}


protocol RMLogLevel {
    var description : String {get}
    var prefix : String {get}
    var postfix : String {get}
    var adjusters : [RMLogAdjuster] {get}
}


struct RMLogInfoLevel : RMLogLevel{
    internal var description: String {
        return "✅"
    }
    
    internal var prefix: String {
        return ""
    }
    
    internal var postfix: String {
        return ":"
    }
    
    internal var adjusters: [RMLogAdjuster] {
        return [RMLogDeviceAdjuster()]
    }
}


class RMLogDeviceAdjuster : RMLogAdjuster{
    func adjustMessage(_ message: String) -> String {
        return "iPhone : " + message
    }
}
