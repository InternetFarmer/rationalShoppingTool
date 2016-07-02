//
//  Item.swift
//  Cal
//
//  Created by Wu on 6/28/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import Foundation

class Item {
    private var price = 0.0
    
    private init(){
        
    }
    
    static func getItem() -> Item{
        return Item()
    }
    
    func getItemPrice() -> Double{
        return price
    }
    
    func getItemPirceString() -> String {
        if price == 0 {
            return "0.00"
        }else{
            return String(format: "%.2f", price)
        }
    }
    
    func isPriceChanged() -> Bool {
        return price != 0
    }
    
    func appendDigit(digit: String){
        if let d = Double(digit) {
            price = (price*1000 + d)/100
        }
    }
    
    func deleteDigit() {
        price = Double(Int(price * 10)) / 100.0
    }
}