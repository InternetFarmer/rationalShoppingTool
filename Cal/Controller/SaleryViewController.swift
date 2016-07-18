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
    @IBOutlet weak var cancelButton: DesignableButton!
    @IBOutlet weak var profileButton: DesignableButton!
    @IBOutlet weak var salaryQuestion: DesignableLabel!
    
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
    }
    
    override func viewWillAppear(animated: Bool) {
        updateView()
        setAnimation()
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
            cancelButton.autostart = false
            profileButton.autostart = false
            salaryQuestion.autostart = true
        } else {
            saleryTitle.autostart = true
            cancelButton.autostart = true
            profileButton.autostart = true
            salaryQuestion.autostart = false
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
        api.updateUserSalary(self.saleryPerHour)
        performSegueWithIdentifier("SalaryToPriceSegue", sender: self)
    }
}
