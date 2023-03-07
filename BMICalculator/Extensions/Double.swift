//
//  Double.swift
//  BMICalculator
//
//  Created by Cormell, David - DPC on 24/02/2022.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
