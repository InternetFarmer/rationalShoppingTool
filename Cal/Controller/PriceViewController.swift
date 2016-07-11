//
//  PriceViewController.swift
//  Cal
//
//  Created by Wu on 6/26/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class PriceViewController: UIViewController, KeyboardDelegate {

    @IBOutlet weak var buttomContainer: UIView!
    
    @IBOutlet weak var displayNumber: UnderlineLabel!
    
    @IBOutlet weak var keyboardView: KeyboardView!
    
    @IBOutlet weak var PriceIconView: UIView!
    
    @IBOutlet weak var calculateButton: RadiusButton!
    
    var price = 0.0
    
    let gradientLayer = CAGradientLayer.getStyleForStartView()
    
    let gradientLayerForKeyboard = CAGradientLayer.getStyleForKeyboardView()
    
    let api = genericAPI.sharedGenericAPI
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer.frame = self.view.bounds
        
        self.view.backgroundColor = UIColor.clearColor()
        
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        
        gradientLayerForKeyboard.frame = self.view.bounds
        
        buttomContainer.layer.insertSublayer(gradientLayerForKeyboard, atIndex: 0)
        
        keyboardView.delegate = self
        
        updateView()
    }
    
    func updateView() {
        displayNumber.text = price.getItemPirceString()
        if(price.isChanged()) {
            PriceIconView.hidden = true
            calculateButton.hidden = false
        } else {
            PriceIconView.hidden = false
            calculateButton.hidden = true
        }
    }
    
    func keyPressed(Key: String) {
        price.appendDigit(Key)
        updateView()
    }

    @IBAction func deleteDigit(sender: UIButton) {
        price.deleteDigit()
        updateView()
    }
    
    @IBAction func calculateClick(sender: AnyObject) {
        api.addItem(ItemViewModel(item_name: "newItem", item_price: self.price))
        api.getUserInit()
        performSegueWithIdentifier("detailsSegue", sender: self)
    }
}
