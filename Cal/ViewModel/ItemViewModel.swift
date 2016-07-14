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
    
    func getEqualUnit(times: Int) -> [UnitViewModel] {
        let costPerTime = self.item_price/Double(times)
        let api = genericAPI.sharedGenericAPI
        var res = [UnitViewModel]()
        let list = api.getAllUnitList()
        for unit in list {
            if isComparable(unit.unit_price, num2: costPerTime) {
                res.append(unit)
            }
        }
        return res
    }
    
    private func isComparable(num1:Double, num2:Double) -> Bool{
        return ((num1 / num2) >= 1) && ((num1 / num2) <= 4)
    }
}