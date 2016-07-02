//
//  genericAPI.swift
//  Cal
//
//  Created by Wu on 7/1/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation
class genericAPI {
    private let persitencyManager : PersisitencyManager
    
    // API Singleton Instance.
    class var sharedGenericAPI: genericAPI {
        struct Singleton {
            static let instance = genericAPI()
        }
        return Singleton.instance
    }
    
    // Consturct
    private init() {
        self.persitencyManager = PersisitencyManager()
    }
    
    func isUserInit() -> Bool {
        return persitencyManager.isUserInit()
    }
}