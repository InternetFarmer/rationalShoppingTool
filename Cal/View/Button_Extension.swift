//
//  Button_Extension.swift
//  Cal
//
//  Created by Wu on 6/25/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

extension UIButton {
    super
    convenience init() {
        self.backgroundColor = UIColor.clearColor()
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.whiteColor().CGColor
    }
}