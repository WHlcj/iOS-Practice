//
//  Extensions.swift
//  FoodPicker
//
//  Created by Changjun Li on 2023/2/8.
//

import SwiftUI

extension AnyLayout {
    static func useVStack(if condition: Bool, spacing: CGFloat, @ViewBuilder content: @escaping () -> some View) -> some View {
        let layout = condition ? AnyLayout(VStackLayout(spacing: spacing)) : AnyLayout(HStackLayout(spacing: spacing))
        
        return layout(content)
    }
}
