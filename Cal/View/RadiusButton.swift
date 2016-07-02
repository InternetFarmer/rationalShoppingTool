//
//  RadiusButton.swift
//  Cal
//
//  Created by Wu on 6/25/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//
import Foundation

import UIKit

class RadiusButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!;
        self.backgroundColor = UIColor.clearColor()
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.whiteColor().CGColor
    }
}