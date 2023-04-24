//
//  AppStorage+.swift
//  FoodPicker
//
//  Created by Changjun Li on 2023/2/17.
//

import SwiftUI

extension AppStorage {
    init(wrappedValue: Value, _ key: UserDefaults.Key, store: UserDefaults? = nil) where Value == Bool {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
    
    init(wrappedValue: Value, _ key: UserDefaults.Key, store: UserDefaults? = nil) where Value: RawRepresentable, Value.RawValue == String {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
    
    init(wrappedValue: Value, _ key: UserDefaults.Key, store: UserDefaults? = nil) where Value == Int {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
}

extension AppStorage where Value: MyUnitProtocol {
    init(wrappedValue: Value = .defaultUnit, _ key: UserDefaults.Key, store: UserDefaults? = nil) where Value: RawRepresentable, Value.RawValue == String {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
}
