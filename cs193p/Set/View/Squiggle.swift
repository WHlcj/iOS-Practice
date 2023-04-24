//
//  Squiggle.swift
//  Set
//
//  Created by Changjun Li on 2023/2/4.
//

import SwiftUI

struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width
        let h = rect.height
        let point1 = CGPoint(x: 0, y: 0.7 * h)
        let point2 = CGPoint(x: 0.4 * w, y: 0.05 * h)
        let point3 = CGPoint(x: 0.95 * w, y: 0.1 * h)
        let point4 = CGPoint(x: 0.6 * w, y: 0.9 * h)
        let point5 = CGPoint(x: 0.3 * w, y: 0.75 * h)
        
        var p = Path()
        
        p.move(to: point1)
        p.addCurve(
            to: point2,
            control1: CGPoint(x: -0.1 * w, y: 0.1 * h),
            control2: CGPoint(x: 0.25 * rect.width, y: -0.1 * h)
        )
        p.addCurve(
            to: point3,
            control1: CGPoint(x: 0.8 * w, y: 0.5 * h),
            control2: CGPoint(x: 0.82 * rect.width, y: -0.3 * rect.height)
        )
        p.addCurve(to: point4,
                   control1: CGPoint(x: 1.0 * w, y: 0.35 * h),
                   control2: CGPoint(x: 0.95 * w, y: 1.0 * h)
        )
        p.addCurve(to: point5,
                   control1: CGPoint(x: 0.45 * w, y: 0.85 * h),
                   control2: CGPoint(x: 0.4 * w, y: 0.7 * h)
        )
        p.addCurve(
            to: point1,
            control1: CGPoint(x: 0.2 * w, y: 0.8 * h),
            control2: CGPoint(x: 0.1 * w, y: 1.2 * h)
        )
        return p
    }
}


struct Squiggle_Previews: PreviewProvider {
    static var previews: some View {
        Squiggle()
            .frame(width: 600,height: 300)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
