//
//  SuffixWrapper.swift
//  FoodPicker
//
//  Created by Changjun Li on 2023/2/8.
//

import Foundation
@propertyWrapper struct Suffix<Unit: MyUnitProtocol & Equatable>: Equatable {
    var wrappedValue: Double
    var unit: Unit
    
    init(wrappedValue: Double,_ unit: Unit) {
        self.wrappedValue = wrappedValue
        self.unit = unit
    }
    
    var projectedValue: Self {
        get { self }
        set { self = newValue }
    }
    
    var description: String {
        let preferredUnit = Unit.getPreferredUnit()
        let measurement = Measurement(value: wrappedValue, unit: <#T##Unit#>)
        
        wrappedValue.formatted(.number.precision(.fractionLength(0...1))) + " " + unit.rawValue
    }
}

extension Suffix: Codable { }
