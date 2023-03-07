//
//  GlobalState.swift
//  BMICalculator
//
//  Created by Hart, Henry (AGDF) on 07/03/2023.
//

import Foundation
import SwiftUI

class GlobalState: ObservableObject {
    
    @Published var heightText = "height (m)"
    @Published var height = ""
    @Published var weightText = "weight (kg)"
    @Published var weight = ""
    @Published var bmiOutput = "Press the button to calculate BMI!"
    
    private var calculatedBMI : Double = 0.0
    private var calculator = BMICalculations()
    
    func calculateAndPrintBMI() {
        var heightDouble = Double(height) ?? 0.0
        var weightDouble = Double(weight) ?? 0.0
        
        if heightText == "height (ft)" {
            // it is in imperial, so convert back to metric and continue
            calculator.imperialToMetric(feet: &heightDouble, stone: &weightDouble)
        }
        
        calculatedBMI = calculator.calculateBmi(weight: weightDouble, height: heightDouble)
        
        if calculatedBMI == 0.0 {
            bmiOutput = "Please enter valid heights and weights."
        }
        else {
            let BMIclassification = calculator.lookUpBmiClassification(bmi: calculatedBMI)
            bmiOutput = "Your BMI is: \(calculatedBMI)\nYou are \(BMIclassification)"
        }
    }
    
    
    // only update the output if there is a numerical one
    func maybeChangeOutput() {
        
        if bmiOutput != "Please enter valid heights and weights." && bmiOutput != "Press the button to calculate BMI!" {
            calculateAndPrintBMI()
        }
    }
    
    func setInputToMetric() {
        heightText = "height (m)"
        weightText = "weight (kg)"
        
        // update output
        maybeChangeOutput()
    }
    
    func setInputToImperial() {
        heightText = "height (ft)"
        weightText = "weight (st)"
        
        // update output
        maybeChangeOutput()
    }
}
