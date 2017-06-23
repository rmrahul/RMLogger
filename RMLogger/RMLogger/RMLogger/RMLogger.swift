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

        writeMessage(logType: logtype)
    }
    
    func log(warning : @escaping @autoclosure ()-> String){
        let logtype = RMLogWarningType(message: warning)
        
        writeMessage(logType: logtype)
    }
    
    func log(debug : @escaping @autoclosure ()-> String){
        let logtype = RMLogDebugType(message: debug)
        
        writeMessage(logType: logtype)
    }
    
    func log(error : @escaping @autoclosure ()-> String){
        let logtype = RMLogErrorType(message: error)

        writeMessage(logType: logtype)
    }

    func log(critical : @escaping @autoclosure ()-> String){
        let logtype = RMLogCriticalType(message: critical)
        
        writeMessage(logType: logtype)
    }

    
    private func isLogAllowed(level : RMLogLevel){
        
    }
    
    private func writeMessage(logType : RMLogType){
        switch configuration.logSource {
        case .console:
            RMLogConsoleWriter.write(message: logType)
            break
        case .file:
            RMLogFileWriter.write(message: logType)
        }
    }
    
}
