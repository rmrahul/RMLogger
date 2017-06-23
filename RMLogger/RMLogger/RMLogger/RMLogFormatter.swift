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

class RMLogDateFormatter : RMLogFormatter{
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .medium
        return formatter
    }

    func formatMessage(_ message: String) -> String {
        return "\(dateFormatter.string(from: Date())) : \(message)"
    }
}




