//
//  AnimationTimingcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/25.
//

import SwiftUI

struct AnimationTimingcamp: View {
    
    @State var isAnimating = false
    let timing = 1.0
    
    var body: some View {
        VStack {
            Button("Button") {
                isAnimating.toggle()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.spring(
                    response: 0.6,
                    dampingFraction: 0.65,
                    blendDuration: 1.0
                ), value: isAnimating)
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50, height: 100)
//                .animation(.linear(duration: timing), value: isAnimating)
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50, height: 100)
//                .animation(.easeIn(duration: timing), value: isAnimating)
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50, height: 100)
//                .animation(.easeInOut, value: isAnimating)
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50, height: 100)
//                .animation(.easeOut, value: isAnimating)
            
            
        }
    }
}

struct AnimationTimingcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTimingcamp()
    }
}
