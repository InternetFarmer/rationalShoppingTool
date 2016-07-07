//
//  PersisitencyManager.swift
//  Cal
//
//  Created by Wu on 7/1/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class PersisitencyManager {
    func isUserInit() -> Bool {
        return false
    }

    // Key in the plist file for numberOfDigit value.
    let NUMBER_OF_DIGITS_KEY = "numberOfDigits"
    
    private let fileManager = NSFileManager.defaultManager()
    
    /**
     * Read from plist file to initilize configuration.
     * Called when this app is initialized.
     */
    func configInit() throws{
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("setting.plist")
        var resdict : NSMutableDictionary?
        //check if file exists
        if(!fileManager.fileExistsAtPath(filename)) {
            // If it doesn't, copy it from the default file in the Bundle
            if let bundlePath = NSBundle.mainBundle().pathForResource("setting", ofType: "plist") {
                resdict = NSMutableDictionary(contentsOfFile: bundlePath)
                do {
                    try fileManager.copyItemAtPath(bundlePath, toPath: filename)
                }catch _ {
                    throw PersistencyError.FileCopyError
                }
            } else {
                throw PersistencyError.FileDoesNotExist
            }
        }
        
        resdict = NSMutableDictionary(contentsOfFile: filename)
    }
    
    private func updateBooleanValue(key: String, value: Bool) throws{
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("setting.plist")
        let dict = NSMutableDictionary()
        dict.setValue(value, forKey: key)
        if fileManager.fileExistsAtPath(filename) {
            if !dict.writeToFile(filename, atomically: true) {
                throw PersistencyError.FileNotWritten
            }
        } else {
            throw PersistencyError.FileDoesNotExist
        }
    }
    
    private func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    private enum PersistencyError: ErrorType {
        case FileNotWritten
        case FileDoesNotExist
        case FileCopyError
        func toString() -> String {
            switch self {
            case .FileDoesNotExist:
                return "No such file."
            case .FileNotWritten:
                return "File not written successfully."
            case .FileCopyError:
                return "File copy error."
            }
        }
    }
}