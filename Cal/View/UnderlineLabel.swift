//
//  UnderlineLabel.swift
//  Cal
//
//  Created by Wu on 6/26/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class UnderlineLabel: UILabel {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!;
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: width)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = false
    }

}
