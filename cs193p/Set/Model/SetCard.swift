//
//  SetCard.swift
//  Set
//
//  Created by Changjun Li on 2022/12/18.
//

import Foundation
import SwiftUI

struct SetCard: Identifiable {
    var shading: Shading
    var color: Color
    var shape: Shape
    var numberOfShapes: Int
    var isSelected = false
    var id: Int

    enum Shape: CaseIterable {
        case diamond,squiggle,oval
    }

    enum Shading: CaseIterable {
        case solid,striped,open
    }
}
