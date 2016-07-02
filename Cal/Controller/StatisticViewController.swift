//
//  StatisticViewController.swift
//  Cal
//
//  Created by Wu on 6/28/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class StatisticViewController: UIViewController {
    
    let gradientLayer = CAGradientLayer.getStyleForStartView()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 520)
    }
}
