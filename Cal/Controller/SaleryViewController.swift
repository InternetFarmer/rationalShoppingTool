//
//  SaleryViewController.swift
//  Cal
//
//  Created by Wu on 7/1/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class SaleryViewController: UIViewController, KeyboardDelegate {
    
    @IBOutlet weak var buttomContainer: UIView!
    
    @IBOutlet weak var displayNumber: UnderlineLabel!
    
    @IBOutlet weak var keyboardView: KeyboardView!
    
    @IBOutlet weak var profileIconView: UIView!
    
    @IBOutlet weak var nextButton: RadiusButton!
    
    @IBOutlet weak var saleryTitle: DesignableLabel!
    
    var api = genericAPI.sharedGenericAPI
    
    var saleryPerHour = 0.0
    
    let gradientLayer = CAGradientLayer.getStyleForStartView()
    
    let gradientLayerForKeyboard = CAGradientLayer.getStyleForKeyboardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer.frame = self.view.bounds
        
        self.view.backgroundColor = UIColor.clearColor()
        
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        
        gradientLayerForKeyboard.frame = self.view.bounds
        
        buttomContainer.layer.insertSublayer(gradientLayerForKeyboard, atIndex: 0)
        
        keyboardView.delegate = self
        
        updateView()
        
        setAnimation()
    }
    
    override func viewDidAppear(animated: Bool) {
        updateView()
        setAnimation()
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    func updateView() {
        displayNumber.text = saleryPerHour.getItemPirceString()
        if(saleryPerHour.isChanged()) {
            profileIconView.hidden = true
            nextButton.hidden = false
        } else {
            profileIconView.hidden = false
            nextButton.hidden = true
        }
    }
    
    func setAnimation() {
        if(api.getUserInit()) {
            saleryTitle.autostart = false
        } else {
            saleryTitle.autostart = true
        }
    }
    
    func keyPressed(Key: String) {
        saleryPerHour.appendDigit(Key)
        updateView()
    }
    
    @IBAction func deleteDigit(sender: UIButton) {
        saleryPerHour.deleteDigit()
        updateView()
    }
    
    @IBAction func nextClick(sender: AnyObject) {
        api.updateUserInit(true)
        performSegueWithIdentifier("SalaryToPriceSegue", sender: self)
    }
}
