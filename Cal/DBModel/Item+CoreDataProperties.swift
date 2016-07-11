//
//  Item+CoreDataProperties.swift
//  Cal
//
//  Created by Wu on 7/10/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var item_name: String?
    @NSManaged var timestamp: NSDate?
    @NSManaged var item_price: NSNumber?

}
