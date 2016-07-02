//
//  CardView.swift
//  Cal
//
//  Created by Wu on 6/29/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class CardView: UIView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!;
        self.layer.cornerRadius = 8
    }
}
