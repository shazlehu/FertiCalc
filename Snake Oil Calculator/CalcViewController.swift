//
//  ViewController.swift
//  Snake Oil Calculator
//
//  Created by Samuel Hazlehurst on 2/5/15.
//  Copyright (c) 2015 Terranian Farm. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {

    private var calc = CalculatorModel()
    
    private let nf = NSNumberFormatter()
    
    @IBOutlet weak var concentration: UITextField!
    
    @IBOutlet weak var recommendation: UITextField!
    
    @IBOutlet weak var recommendationLabel: UILabel!
    
    @IBOutlet weak var answer: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        concentration.keyboardType = UIKeyboardType.DecimalPad
        recommendation.keyboardType = UIKeyboardType.DecimalPad
        
        concentration.becomeFirstResponder()
        
        concentration.addTarget(self, action: "updateConcentration:", forControlEvents: UIControlEvents.EditingChanged)
        recommendation.addTarget(self, action: "updateRecommendation:", forControlEvents: UIControlEvents.EditingChanged)
        
        nf.groupingSeparator = ","
        nf.usesGroupingSeparator = true
        nf.numberStyle = NSNumberFormatterStyle.DecimalStyle
        nf.maximumSignificantDigits = 2
    }

    @IBAction func concentrationSelection(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            // ppm
            calc.ppm = true
        default:
            calc.ppm = false
        }
        calculate()
    }
    
    
    @IBAction func areaSelection(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            calc.inputType = CalculatorModel.Area.K_SQFT
        default:
            calc.inputType = CalculatorModel.Area.ACRE
        }
        calculate()
    }
   
    @IBAction func answerSelection(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            calc.outputType = CalculatorModel.Area.K_SQFT
        default:
            calc.outputType = CalculatorModel.Area.ACRE

        }
        calculate()
    }
    
    func calculate() {

        // format the output so it uses commas
        if (concentration.text != nil && recommendation.text != nil) {
            
            if let concentrationValue = nf.numberFromString(concentration.text!) {
                calc.concentration = concentrationValue.doubleValue
            }
            
            if let requirementValue = nf.numberFromString(recommendation.text!) {
                
                calc.requirement = requirementValue.doubleValue
            }
            let answerValue = calc.getConcentration()
            answer.text = nf.stringFromNumber(answerValue)!
                //+ calc.getAreaLabel()
        }
    }

    func updateConcentration(field: UITextField)
    {
        calculate()
    }
    
    func updateRecommendation(field: UITextField)
    {
        calculate()
    }
     
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
}
