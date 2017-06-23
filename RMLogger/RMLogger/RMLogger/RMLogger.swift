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
    
    func log(info : @escaping @autoclosure ()-> String){
        let logtype = RMLogInfoType(message: info)

        switch configuration.logSource {
        case .console:
            RMLogConsoleWriter.write(message: logtype)
            break
        case .file:
            RMLogFileWriter.write(message: logtype)
        }
    }
    
    
}
