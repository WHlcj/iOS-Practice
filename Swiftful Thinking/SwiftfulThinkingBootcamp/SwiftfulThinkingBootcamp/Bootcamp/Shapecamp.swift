//
//  Shapecamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/18.
//

import SwiftUI

struct Shapecamp: View {
    var body: some View {
 //       Ellipse()
 //       Circle()
//        Capsule(style: .continuous)
      //  Rectangle()
        RoundedRectangle(cornerRadius: 10)
//            .fill(Color.blue)
//            .foregroundColor(.red)
            //.stroke(.red, lineWidth: 30)
//            .stroke(
//                .orange,
//                style: StrokeStyle(
//                    lineWidth: 50,
//                    lineCap: .butt,
//                    dash: [10]))
//            .trim(from: 0.5,to: 1.0)
            .frame(width: 200, height: 100)
        
        
    }
}

struct Shapecamp_Previews: PreviewProvider {
    static var previews: some View {
        Shapecamp()
    }
}
