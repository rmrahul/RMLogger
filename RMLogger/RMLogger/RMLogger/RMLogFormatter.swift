//
//  RMLogAdjuster.swift
//  RMLogger
//
//  Created by Rahul Mane on 15/06/17.
//  Copyright © 2017 Rahul Mane. All rights reserved.
//

import UIKit

protocol RMLogFormatter {
    func formatMessage(_ message: String) -> String
}

class RMLogDeviceFormatter : RMLogFormatter{
    func formatMessage(_ message: String) -> String {
        return "\(UIDevice.current.model) : \(message)"
    }
}

class RMLogVersionFormatter : RMLogFormatter{
    func formatMessage(_ message: String) -> String {
        return "\(UIDevice.current.systemVersion) : \(message)"
    }
}



