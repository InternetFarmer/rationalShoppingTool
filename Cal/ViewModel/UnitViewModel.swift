//
//  UnitViewModel.swift
//  Cal
//
//  Created by Wu on 7/11/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class UnitViewModel {
    var unit_name: String
    var unit_price: Double
    
    init(unit_name: String, unit_price: Double) {
        self.unit_price = unit_price
        self.unit_name = unit_name
    }
}