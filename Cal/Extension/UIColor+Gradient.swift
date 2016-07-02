//
//  UIColor+Gradient.swift
//  Cal
//
//  Created by Wu on 6/26/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1)
    }
}