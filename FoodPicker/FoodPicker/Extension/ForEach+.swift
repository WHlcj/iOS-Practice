//
//  ForEach.swift
//  FoodPicker
//
//  Created by Changjun Li on 2023/2/17.
//

import SwiftUI

extension ForEach where Data.Element: Identifiable & View, ID == Content.ID, Content == Data.Element {
    init(_ data: Data) {
        self.init(data) { $0 }
    }
}
