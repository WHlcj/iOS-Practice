//
//  Unit.swift
//  FoodPicker
//
//  Created by Changjun Li on 2023/2/17.
//

import SwiftUI

protocol MyUnitProtocol: Codable, Identifiable, CaseIterable, View, RawRepresentable where RawValue == String, AllCases: RandomAccessCollection {
    associatedtype T: Dimension
    
    static var userDefault: UserDefaults.Key { get }
    static var defaultUnit: Self { get }
    
    var dimension: T { get }
}

extension MyUnitProtocol {
    static func getPreferredUnit() -> Self {
        AppStorage(userDefault).wrappedValue
    }
}

enum MyEnergyUnit: String, MyUnitProtocol {
    
    static var userDefault: UserDefaults.Key = .preferredEnergyUnit
  
    static var defaultUnit: MyEnergyUnit = .cal
    
    case cal = "大卡"
    
    var dimension: UnitEnergy {
        switch self {
        case .cal: return .calories
        }
    }
}

enum MyWeightUnit: String, MyUnitProtocol {
    static var userDefault: UserDefaults.Key = .preferredWeightUnit
    
    static var defaultUnit: MyWeightUnit = .gram
    
    case gram = "g", pound = "lb"
    
    var dimension: UnitMass {
        switch self {
        case .gram:
            return .grams
        case .pound:
            return .pounds
        }
    }
}

extension MyUnitProtocol {
    var id: Self { self }
    var body: some View {
        Text(rawValue)
    }
}

