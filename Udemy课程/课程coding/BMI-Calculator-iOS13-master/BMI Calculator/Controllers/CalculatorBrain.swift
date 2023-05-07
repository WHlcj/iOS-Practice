//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Changjun Li on 2023/5/2.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)

        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: .blue)
        } else if bmiValue < 24.5 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor(red: 231 / 255, green: 97 / 255, blue: 97 / 255, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        bmi?.color ?? .blue
    }
    
}
