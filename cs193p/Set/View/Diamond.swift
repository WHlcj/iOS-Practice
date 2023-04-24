//
//  Diamond.swift
//  Set
//
//  Created by Changjun Li on 2023/2/4.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let top = CGPoint(x: rect.midX, y: 0)
        let left = CGPoint(x: 0, y: rect.midY)
        let bottom = CGPoint(x: rect.midX, y: rect.maxY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        
        var p = Path()
        p.move(to: top)
        p.addLine(to: left)
        p.addLine(to: bottom)
        p.addLine(to: right)
        p.addLine(to: top)
        return p
    }
}



struct Diamond_Previews: PreviewProvider {
    static var previews: some View {
        Diamond()
    }
}
