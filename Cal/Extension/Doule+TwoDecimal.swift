//
//  Doule+TwoDecimal.swift
//  Cal
//
//  Created by Wu on 7/1/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

extension Double{
    func getItemPirceString() -> String {
        if self == 0 {
            return "0.00"
        }else{
            return String(format: "%.2f", self)
        }
    }
    
    func isChanged() -> Bool {
        return self != 0
    }
    
    mutating func appendDigit(digit: String){
        if let d = Double(digit) {
            self = (self*1000 + d)/100
        }
    }
    
    mutating func deleteDigit() {
        self = Double(Int(self * 10)) / 100.0
    }
}