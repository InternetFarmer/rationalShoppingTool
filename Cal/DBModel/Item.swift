//
//  Item.swift
//  Cal
//
//  Created by Wu on 7/10/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation
import CoreData


class Item: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    func toViewModel() -> ItemViewModel {
        // TODO
        return ItemViewModel(item_name: self.item_name!, item_price: Double(self.item_price!))
    }
}
