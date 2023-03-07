//
//  BMICalculations.swift
//  BMICalculator
//
//  Created by Cormell, David - DPC on 24/02/2022.
//

import Foundation



class BMICalculations {
    func calculateBmi(weight: Double, height: Double) -> Double {
        if height <= 0.0 {
            return 0.0
        }
        else {
            let heightInMeters = height/100
            let nonRoundedBMI = weight / heightInMeters / heightInMeters
            
            // round it to 1dp
            return round(10 * nonRoundedBMI) / 10
        }
    }
    
    func lookUpBmiClassification(bmi: Double) -> String {
        if bmi < 18.5 {
            return "Underweight"
        } else if bmi >= 18.5 && bmi < 25 {
            return "Healthy"
        } else if bmi >= 25.0 && bmi < 30 {
            return "Overweight"
        }
        return "Obese"
    }
    
    func imperialToMetric(feet: inout Double, stone: inout Double) {
        // convert them
        feet *= 30.48
        stone *= 6.35029
    }
}
