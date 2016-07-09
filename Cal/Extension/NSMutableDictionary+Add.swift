//
//  NSMutableDictionary+Add.swift
//  Cal
//
//  Created by Wu on 7/7/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

extension NSMutableDictionary {
    func updateBooleanValue(filename: String, key: String, value: Bool) -> Bool{
        self.setValue(value, forKey: key)
        return self.writeToFile(filename, atomically: true)
    }
}