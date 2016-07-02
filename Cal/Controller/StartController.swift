//
//  StartController.swift
//  Cal
//
//  Created by Wu on 6/25/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class StartController: UIViewController {
    
    @IBOutlet weak var startButton: RadiusButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var api = genericAPI.sharedGenericAPI
    
    let gradientLayer = CAGradientLayer.getStyleForStartView()
    
    override func viewDidLoad() {
        // 1
        self.view.backgroundColor = UIColor.clearColor()
        
        // 2
        gradientLayer.frame = self.view.bounds
        
        // 5
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
    }
    
    @IBAction func startButtonClick(sender: AnyObject) {
        if api.isUserInit() {
            performSegueWithIdentifier("StartToPriceSegue", sender: self)
        } else {
            performSegueWithIdentifier("StartToSalarySegue", sender: self)
        }
    }
}
