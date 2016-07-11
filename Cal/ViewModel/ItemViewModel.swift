//
//  ItemViewModel.swift
//  Cal
//
//  Created by Wu on 7/10/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class ItemViewModel {
    var item_name: String = ""
    var item_price: Double = 0
    
    init(item_name: String, item_price: Double) {
        self.item_name = item_name
        self.item_price = item_price
    }
    
    func getEstimatedWorkHour(salery : Double) -> Int {
        return Int(item_price/salery)
    }
}