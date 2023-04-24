//
//  UserDefaultsKey.swift
//  FoodPicker
//
//  Created by Changjun Li on 2023/2/17.
//

import SwiftUI

extension UserDefaults {
    enum Key: String {
        case shouldUseDarkMode
        case startTab
        case foodList
        case preferredEnergyUnit
        case preferredWeightUnit
    }
}
