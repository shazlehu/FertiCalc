//
//  ViewController.swift
//  Snake Oil Calculator
//
//  Created by Samuel Hazlehurst on 2/5/15.
//  Copyright (c) 2015 Terranian Farm. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    
    
    var calc : CalculatorModel?
    
    let nf = NSNumberFormatter()
    
    
    @IBOutlet weak var concentration: UITextField!
    
    @IBOutlet weak var recommendation: UITextField!
    
    @IBOutlet weak var recommendationLabel: UILabel!
    
    @IBOutlet weak var answer: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        concentration.keyboardType = UIKeyboardType.DecimalPad
        recommendation.keyboardType = UIKeyboardType.DecimalPad
        
        concentration.becomeFirstResponder()
        
        concentration.addTarget(self, action: "updateConcentration:", forControlEvents: UIControlEvents.EditingChanged)
        recommendation.addTarget(self, action: "updateRecommendation:", forControlEvents: UIControlEvents.EditingChanged)
        
        
        nf.groupingSeparator = ","
        nf.usesGroupingSeparator = true
        nf.numberStyle = NSNumberFormatterStyle.DecimalStyle
        nf.maximumSignificantDigits = 2
        
        registerForKeyboardNotifications()
    }
    


    @IBOutlet weak var contentView: UIView!
    
    @IBAction func concentrationSelection(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            // ppm
            calc!.ppm = true
        default:
            calc!.ppm = false
        }
        calculate()
    }
    
    
    @IBAction func areaSelection(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            calc!.inputType = CalculatorModel.Area.K_SQFT
        default:
            calc!.inputType = CalculatorModel.Area.ACRE
        }
        calculate()
    }
   
    @IBAction func answerSelection(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            calc!.outputType = CalculatorModel.Area.K_SQFT
        default:
            calc!.outputType = CalculatorModel.Area.ACRE

        }
        calculate()
    }
      @IBAction func calculate(sender: UIButton) {
        
        // format the output so it uses commas

        if (concentration.text != nil && recommendation.text != nil) {
            
            if let concentrationValue = nf.numberFromString(concentration.text!) {
                calc!.concentration = concentrationValue.doubleValue
            }
            
            if let requirementValue = nf.numberFromString(recommendation.text!) {
        
                calc!.requirement = requirementValue.doubleValue
            }
            
            var answerValue = calc!.getConcentration()
            

            println("\(nf.stringFromNumber(answerValue)!)")
            answer.text = nf.stringFromNumber(answerValue)! +
                calc!.getAreaLabel()
            
        }
        
    }
    
    func calculate() {
        
        // format the output so it uses commas
        
        if (concentration.text != nil && recommendation.text != nil) {
            
            if let concentrationValue = nf.numberFromString(concentration.text!) {
                calc!.concentration = concentrationValue.doubleValue
            }
            
            if let requirementValue = nf.numberFromString(recommendation.text!) {
                
                calc!.requirement = requirementValue.doubleValue
            }
            
            var answerValue = calc!.getConcentration()
            
            
            println("\(nf.stringFromNumber(answerValue)!)")
            answer.text = nf.stringFromNumber(answerValue)! +
                calc!.getAreaLabel()
            
        }
        
    }

    @IBOutlet weak var cView: UIView!
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
        cView.endEditing(true)
        println("touchesBegan")
    }
    
    func updateConcentration(field: UITextField)
    {
        calculate()
    }
    
    func updateRecommendation(field: UITextField)
    {
        calculate()
    }
    // Call this method somewhere in your view controller setup code.
//    func registerForKeyboardNotifications() {
//        let notificationCenter = NSNotificationCenter.defaultCenter()
//        notificationCenter.addObserver(self,
//            selector: "keyboardWillBeShown:",
//            name: UIKeyboardWillShowNotification,
//            object: nil)
//        notificationCenter.addObserver(self,
//            selector: "keyboardWillBeHidden:",
//            name: UIKeyboardWillHideNotification,
//            object: nil)
//    }
    
    var activeTextField : UITextField?
    /*
    // Called when the UIKeyboardDidShowNotification is sent.
    func keyboardWillBeShown(sender: NSNotification) {
        let info: NSDictionary = sender.userInfo!
        let value: NSValue = info.valueForKey(UIKeyboardFrameBeginUserInfoKey) as NSValue
        let keyboardSize: CGSize = value.CGRectValue().size
        let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)

        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
        // If active text field is hidden by keyboard, scroll it so it's visible
        // Your app might not need or want this behavior.
        var aRect: CGRect = self.view.frame
        aRect.size.height -= keyboardSize.height
        let activeTextFieldRect: CGRect? = activeTextField?.frame
        let activeTextFieldOrigin: CGPoint? = activeTextFieldRect?.origin
        if (activeTextFieldOrigin != nil && activeTextFieldRect != nil) {
            if (!CGRectContainsPoint(aRect, activeTextFieldOrigin!)) {
                scrollView.scrollRectToVisible(activeTextFieldRect!, animated:true)
            }
        }
    }
    
    // Called when the UIKeyboardWillHideNotification is sent
    func keyboardWillBeHidden(sender: NSNotification) {

        let contentInsets: UIEdgeInsets = UIEdgeInsetsZero

        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    

    
    func textFieldDidBeginEditing(textField: UITextField!) {
        activeTextField = textField
        scrollView.scrollEnabled = true
    }
    
    func textFieldDidEndEditing(textField: UITextField!) {
        let scrollView = view as UIScrollView
        activeTextField = nil
        scrollView.scrollEnabled = false
    }


    override func viewWillAppear(animated: Bool) {
        // Get a reference to the model data from the custom tab bar controller.
        calc = CalculatorModel()
        //(self.tabBarController as TabBarController).calc
        recommendationLabel.text = calc!.requirementLabel

    }
    
    override func viewDidLayoutSubviews()
    {
        let scrollViewBounds = scrollView.bounds
        let containerViewBounds = contentView.bounds
        
        var scrollViewInsets = UIEdgeInsetsZero
        scrollViewInsets.top = scrollViewBounds.size.height/2.0;
        scrollViewInsets.top -= contentView.bounds.size.height/2.0;
        
        scrollViewInsets.bottom = scrollViewBounds.size.height/2.0
        scrollViewInsets.bottom -= contentView.bounds.size.height/2.0;
        scrollViewInsets.bottom += 1
        
        scrollView.contentInset = scrollViewInsets
    }
*/
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        
//        // Dispose of any resources that can be recreated.
//    }
}
