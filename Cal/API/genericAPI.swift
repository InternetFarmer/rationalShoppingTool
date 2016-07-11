//
//  genericAPI.swift
//  Cal
//
//  Created by Wu on 7/1/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation
class genericAPI {
    private var persitencyManager : PersisitencyManager
    
    // API Singleton Instance.
    class var sharedGenericAPI: genericAPI {
        struct Singleton {
            static let instance = genericAPI()
        }
        return Singleton.instance
    }
    
    // Consturct
    private init(){
        self.persitencyManager = PersisitencyManager()
    }
    
    func getUserInit() -> Bool {
        return persitencyManager.isUserInit()
    }
    
    func updateUserInit(is_init: Bool) {
        persitencyManager.updateUserInit(is_init)
    }
    
    func getUserSalary() -> Double {
        return persitencyManager.getUserSalary()
    }
    
    func updateUserSalary(salary: Double) {
        persitencyManager.updateUserSalary(salary)
    }
    
    func getLastestItem() -> ItemViewModel? {
        if let item = persitencyManager.getLastestItem() {
            return item.toViewModel()
        }
        return nil
    }

    func addItem(item : ItemViewModel) {
        persitencyManager.addItem(item.item_name, item_price: item.item_price)
    }
}