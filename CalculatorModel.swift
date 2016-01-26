//
//  CalculatorModel.swift
//  Snake Oil Calculator
//
//  Created by Samuel Hazlehurst on 2/5/15.
//  Copyright (c) 2015 Terranian Farm. All rights reserved.
//

import Foundation

class CalculatorModel {
    
    // google answer for "acre to sq ft" divided by 1,000
    
    private struct Constants {
        static let ACRE_TO_K_SQFT : Double = 43.560
        static let MILLION : Double = 1000000
        static let RequirementLabel = "Pound Nutrient recommended:"
    }
    
    enum Area : CustomStringConvertible {
        case K_SQFT
        case ACRE
        
        var description : String {
            get {
                switch self {
                case .K_SQFT:
                    return "K_SQFT"
                case .ACRE:
                    return "ACRE"
                }
            }
        }
    }
    
    var ppm = true
    var inputType = Area.K_SQFT
    var outputType = Area.K_SQFT
    
    var concentration : Double = 0
    var requirement : Double = 0
    
    func getConcentration() -> Double {
        var actualConcentration = concentration
        if ppm {
            actualConcentration = concentration / Constants.MILLION
        }
        else {
            actualConcentration = concentration / 100
        }
        
        if (outputType == inputType)
        {
            return requirement / actualConcentration
        }
        
        if (outputType == Area.K_SQFT) {
            return requirement / actualConcentration / Constants.ACRE_TO_K_SQFT

        }
        
        return requirement / actualConcentration * Constants.ACRE_TO_K_SQFT
        
    }
}
