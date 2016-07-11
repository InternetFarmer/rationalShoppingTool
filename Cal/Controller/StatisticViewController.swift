//
//  StatisticViewController.swift
//  Cal
//
//  Created by Wu on 6/28/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class StatisticViewController: UIViewController {
    
    @IBOutlet weak var userSalaryLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var estimatedWorkHourLabel: UILabel!
    
    let api = genericAPI.sharedGenericAPI
    
    private var item : ItemViewModel?
    private var userSalery : Double?
    
    override func viewDidLoad() {
        // Add gradientLayer
        let gradientLayer = CAGradientLayer.getStyleForStartView()
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        item = api.getLastestItem()
        userSalery = api.getUserSalary()
        
        updateView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 520)
    }
    
    func updateView() {
        self.userSalaryLabel.text = (String)(userSalery!)
        if let item = self.item {
            self.itemPriceLabel.text = (String)(item.item_price)
            self.estimatedWorkHourLabel.text = (String)(item.getEstimatedWorkHour(userSalery!))
        }
    }
}
