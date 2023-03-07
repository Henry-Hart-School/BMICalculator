//
//  BMICalculatorTests.swift
//  BMICalculatorTests
//
//  Created by David Cormell on 23/02/2022.
//

import XCTest
@testable import BMICalculator

class BMICalculatorTests: XCTestCase {

    func testCalculateBmiWithHeightAndWeightReturnsCorrectBmi() throws {
        //arrange
        let calculator = BMICalculations()
        let testCases = [(weight: 16.9, height: 105.4, expected: 15.2),(weight: 16.6, height: 99.1, expected: 16.9),(weight: 18.3, height: 103.5, expected: 17.1)]
        
        //act
        for testCase in testCases {
            let actual = calculator.calculateBmi(weight: testCase.weight, height: testCase.height)
            //assert
            XCTAssertEqual(actual, testCase.expected)
        }
        
    }
    
    func testLookupBmiClassification() throws {
        //arrange
        let calculator = BMICalculations()
        let testCases = [(bmi: 18.0, expected: "Underweight"),(bmi: 18.5, expected: "Healthy"),(bmi: 24.9, expected: "Healthy"),(bmi: 25, expected: "Overweight"),(bmi: 29.9, expected: "Overweight"),(bmi: 30, expected: "Obese"),(bmi: 40, expected: "Obese")]
        
        //act
        for testCase in testCases {
            let actual = calculator.lookUpBmiClassification(bmi: testCase.bmi)
            //assert
            XCTAssertEqual(actual, testCase.expected)
        }
    }
    

}
