//
//  BMICalculatorApp.swift
//  BMICalculator
//
//  Created by David Cormell on 23/02/2022.
//

import SwiftUI

@main
struct BMICalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(GlobalState())
        }
    }
}
