//
//  RMLogWriter.swift
//  RMLogger
//
//  Created by Rahul Mane on 15/06/17.
//  Copyright © 2017 Rahul Mane. All rights reserved.
//

import UIKit

protocol RMLogWriter {
    static func write(message : RMLogType)
}

class RMLogConsoleWriter: RMLogWriter {
    static func write(message: RMLogType) {
        print(message.formattedMessage)
    }
}

class RMLogFileWriter: RMLogWriter{
    static func write(message: RMLogType) {
            // write it on file
    }
}
