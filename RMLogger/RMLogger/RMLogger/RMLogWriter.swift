//
//  RMLogWriter.swift
//  RMLogger
//
//  Created by Rahul Mane on 15/06/17.
//  Copyright © 2017 Rahul Mane. All rights reserved.
//

import UIKit

protocol RMLogWriter {
    func write(message : RMLogType)
}

class RMLogConsoleWriter: RMLogWriter {
    func write(message: RMLogType) {
        print(message.formattedMessage)
    }
}

class RMLogFileWriter: RMLogWriter{
    ///The max size a log file can be in Kilobytes. Default is 1024 (1 MB)
    public var maxFileSize: UInt64 = 1024
    
    ///The max number of log file that will be stored. Once this point is reached, the oldest file is deleted.
    public var maxFileCount = 4
    
    private var directory = RMLogFileWriter.defaultDirectory()
    
    //The name of the log files.
    public var name = "logfile"
    
    private class func defaultDirectory() -> String{
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true)
        let path = "\(paths[0])/Logs"
        
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: path) && path != "" {
            do {
                try fileManager.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
            }
            catch{
                //Need to handle exception here.
            }
        }
        return path
    }
    
    func write(message: RMLogType) {
        // write it on file
        let path = "\(directory)/\(logName(num: 0))"
        print(path)
        
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: path){
            //need to create it 
            do{
                try "".write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            }
            catch{
                //need to catch exception here
            }
        }
        
        if let fileHandle = FileHandle(forWritingAtPath: path){
            let writeText = "\(message.formattedMessage) \n"
            fileHandle.seekToEndOfFile()
            fileHandle.write(writeText.data(using: String.Encoding.utf8)!)
            fileHandle.closeFile()
            cleanup()
        }
    }
    
    
    ///do the checks and cleanup
    func cleanup() {
        let path = "\(directory)/\(logName(num: 0))"
        let size = fileSize(path: path)
        let maxSize: UInt64 = maxFileSize*1024
        if size > 0 && size >= maxSize && maxSize > 0 && maxFileCount > 0 {
            rename(index: 0)
            //delete the oldest file
            let deletePath = "\(directory)/\(logName(num: maxFileCount))"
            let fileManager = FileManager.default
            do {
                try fileManager.removeItem(atPath: deletePath)
            } catch _ {
            }
        }
    }
    
    ///check the size of a file
    func fileSize(path: String) -> UInt64 {
        let fileManager = FileManager.default
        let attrs: NSDictionary? = try? fileManager.attributesOfItem(atPath: path) as NSDictionary
        if let dict = attrs {
            return dict.fileSize()
        }
        return 0
    }
    
    ///Recursive method call to rename log files
    func rename(index: Int) {
        let fileManager = FileManager.default
        let path = "\(directory)/\(logName(num: index))"
        let newPath = "\(directory)/\(logName(num: index+1))"
        if fileManager.fileExists(atPath: newPath) {
            rename(index: index+1)
        }
        do {
            try fileManager.moveItem(atPath: path, toPath: newPath)
        } catch _ {
        }
    }
    
    ///gets the log name
    func logName(num :Int) -> String {
        return "\(name)-\(num).log"
    }
}
