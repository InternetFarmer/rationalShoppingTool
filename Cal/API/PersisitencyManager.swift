//
//  PersisitencyManager.swift
//  Cal
//
//  Created by Wu on 7/1/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit
import CoreData

class PersisitencyManager {

    // Key in the plist file for whether user is init value.
    private let IS_INIT = "is_init"
    
    // Key in the plist file for user salary per hour
    private let SALARY = "salary"
    
    private let fileManager = NSFileManager.defaultManager()
    
    private var user_info_file = ""
    
    private var unit_file = ""
    
    private let app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    private let resdict : NSMutableDictionary?
    
    init() {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0] as NSString
        self.user_info_file = documentsDirectory.stringByAppendingPathComponent("user_info.plist")
        self.unit_file = documentsDirectory.stringByAppendingPathComponent("unit.plist")
        if(!fileManager.fileExistsAtPath(self.user_info_file)) {
            // If it doesn't, copy it from the default file in the Bundle
            let bundlePath = NSBundle.mainBundle().pathForResource("user_info", ofType: "plist")!
            do {
                try fileManager.copyItemAtPath(bundlePath, toPath: self.user_info_file)
            }catch {
                fatalError("file reading failed")
            }
        }
        
        if(!fileManager.fileExistsAtPath(self.user_info_file)) {
            // If it doesn't, copy it from the default file in the Bundle
            let bundlePath = NSBundle.mainBundle().pathForResource("unit", ofType: "plist")!
            do {
                try fileManager.copyItemAtPath(bundlePath, toPath: self.unit_file)
            }catch {
                fatalError("file reading failed")
            }
        }
        resdict = NSMutableDictionary(contentsOfFile: user_info_file)
    }
    
    
    // Read from plist file to check whether user is initialized
    func isUserInit() -> Bool {
        if let dict = resdict {
            if let is_init = dict[self.IS_INIT]{
                return is_init as! Bool
            }
        }
        return false
    }
    
    // Read from plist to get user salary per hour
    func getUserSalary() -> Double {
        if let dict = resdict {
            if let salery = dict[self.SALARY]{
                return salery as! Double
            }
        }
        return 0
    }
    
    // Update the user initialization status in plist file
    func updateUserInit(is_init: Bool) {
        if let dict = resdict {
            if !dict.updateValue(user_info_file, key: IS_INIT, value: is_init) {
                print("update user init failed")
            }
        }
    }
    
    // Update the user salary information in plist file
    func updateUserSalary(salary: Double) {
        if let dict = resdict {
            if !dict.updateValue(user_info_file, key: SALARY, value: salary) {
                print("update user salery failed")
            }
        }
    }
    
    // Add a new item into the database
    func addItem(item_name: String, item_price: Double) {
        let context = app.managedObjectContext
        let item = NSEntityDescription.insertNewObjectForEntityForName("Item",
                                                                       inManagedObjectContext: context) as! Item
        
        item.item_name = item_name
        item.item_price = item_price
        item.timestamp = NSDate()
        do {
            try context.save()
            print("save successfully！")
        } catch {
            fatalError("save failed：\(error)")
        }
    }
    
    // Get the lastest added item
    func getLastestItem() -> Item? {
        let request = NSFetchRequest(entityName: "Item")
        request.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
        request.fetchLimit = 1
        
        do {
            let result = try app.managedObjectContext.executeFetchRequest(request)
            
            if let items = result as? [Item] {
                return items[0]
            }
        } catch {
            fatalError("fetch failed: \(error)")
        }
        return nil
    }
    
    // Get all stored unit dic
    func getAllUnitList() -> [UnitViewModel] {
        let resUnitDict = NSMutableDictionary(contentsOfFile: unit_file)
        var res = [UnitViewModel]()
        if let dic = resUnitDict {
            for (key, value) in dic {
                res.append(UnitViewModel(unit_name: key as! String, unit_price: value as! Double))
            }
        }
        return res
    }
}