//
//  PersisitencyManager.swift
//  Cal
//
//  Created by Wu on 7/1/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class PersisitencyManager {

    // Key in the plist file for whether user is init value.
    let IS_INIT = "is_init"
    
    private let fileManager = NSFileManager.defaultManager()
    
    private var user_info_file = ""
    
    private var history_file = ""
    
    init() {
        self.user_info_file = getDocumentsDirectory().stringByAppendingPathComponent("user_info.plist")
        self.history_file = getDocumentsDirectory().stringByAppendingPathComponent("history.plist")
    }
    
    func isUserInit() -> Bool {
        let resdict = NSMutableDictionary(contentsOfFile: user_info_file)
        if let dict = resdict {
            if let is_init = dict[self.IS_INIT]{
                return is_init as! Bool
            }
        }
        return false
    }
    
    func updateUserInit(is_init: Bool) {
        let dict = NSMutableDictionary()
        if !dict.updateBooleanValue(user_info_file, key: IS_INIT, value: is_init) {
            print("update user init failed")
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