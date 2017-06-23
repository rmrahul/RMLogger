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
    private let fileWritter = RMLogFileWriter()
    private let consoleWritter = RMLogConsoleWriter()
    
    init(configuration : RMLogConfiguration = RMLogConfiguration.defaultConfiguration()) {
        self.configuration = configuration
    }
    
    func log(info : @escaping @autoclosure ()-> String){
        if isLogAllowed(level: .info){
            let logtype = RMLogInfoType(message: info)
            writeMessage(logType: logtype)
        }
    }
    
    func log(warning : @escaping @autoclosure ()-> String){
        if isLogAllowed(level: .warning){
            let logtype = RMLogWarningType(message: warning)
            writeMessage(logType: logtype)
        }
    }
    
    func log(debug : @escaping @autoclosure ()-> String){
        if isLogAllowed(level: .debug){
            let logtype = RMLogDebugType(message: debug)
            writeMessage(logType: logtype)
        }
    }
    
    func log(error : @escaping @autoclosure ()-> String){
        if isLogAllowed(level: .error){
            let logtype = RMLogErrorType(message: error)
            writeMessage(logType: logtype)
        }
    }

    func log(critical : @escaping @autoclosure ()-> String){
        if isLogAllowed(level: .critical){
            let logtype = RMLogCriticalType(message: critical)
            writeMessage(logType: logtype)
        }
    }

    
    private func isLogAllowed(level : RMLogLevel) -> Bool{
        return configuration.logLevels.contains(level)
    }
    
    private func writeMessage(logType : RMLogType){
        switch configuration.logSource {
        case .console:
            consoleWritter.write(message: logType)
            break
        case .file:
            fileWritter.write(message: logType)
        }
    }
    
}
