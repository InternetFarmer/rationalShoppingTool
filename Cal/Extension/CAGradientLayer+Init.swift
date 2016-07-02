//
//  CAGradientLayer+Init.swift
//  Cal
//
//  Created by Wu on 6/26/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    static func getStyleForStartView() -> CAGradientLayer {
        let layer = CAGradientLayer();
        let color1 = UIColor(red: 15, green: 81, blue: 118).CGColor as CGColorRef
        let color2 = UIColor(red: 136, green: 215, blue: 205).CGColor as CGColorRef
        layer.colors = [color1, color2]
        layer.locations = [0.0, 1.0]
        return layer
    }
    
    static func getStyleForKeyboardView() -> CAGradientLayer {
        let layer = CAGradientLayer();
        let color1 = UIColor(red: 34, green: 71, blue: 78).CGColor as CGColorRef
        let color2 = UIColor(red: 67, green: 107, blue: 102).CGColor as CGColorRef
        layer.colors = [color1, color2]
        layer.locations = [0.0, 1.0]
        return layer
    }
}
