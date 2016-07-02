//
//  NavigationBar.swift
//  Cal
//
//  Created by Wu on 6/26/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class NavigationBar: UINavigationBar {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!;
        self.backgroundColor = UIColor.clearColor()
        self.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.shadowImage = UIImage()
        self.tintColor = UIColor.whiteColor()
    }
}
