//
//  RMLogConfiguration.swift
//  RMLogger
//
//  Created by Rahul Mane on 15/06/17.
//  Copyright © 2017 Rahul Mane. All rights reserved.
//

import UIKit

enum RMLogLevel {
    case info
    case warning
    case debug
    case error
    case critical
}

enum RMLogSource {
    case console
    case file
}

struct RMLogConfiguration {
    public let logLevels : [RMLogLevel]
    public let logSource : RMLogSource
    
    public init(logLevels : [RMLogLevel] = [], logSource : RMLogSource = RMLogSource.console){
        self.logLevels = logLevels
        self.logSource = logSource
    }
    
    public static func defaultConfiguration() -> RMLogConfiguration{
        let logLevels : [RMLogLevel] = []
        let logSource = RMLogSource.console
        
        return RMLogConfiguration(logLevels: logLevels, logSource: logSource)
    }
}
