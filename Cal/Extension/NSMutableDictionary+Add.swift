//
//  NSMutableDictionary+Add.swift
//  Cal
//
//  Created by Wu on 7/7/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

extension NSMutableDictionary {
    func updateValue(filename: String, key: String, value: AnyObject) -> Bool{
        self.setValue(value, forKey: key)
        return self.writeToFile(filename, atomically: true)
    }
}