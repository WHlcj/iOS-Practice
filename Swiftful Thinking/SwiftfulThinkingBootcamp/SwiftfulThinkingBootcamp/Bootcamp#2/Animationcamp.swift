//
//  Animationcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/25.
//

import SwiftUI

struct Animationcamp: View {
    
    @State var isAnimated = false
    
    var body: some View {
        VStack {
            Button("Button") {
                withAnimation(
                    .default
                        .repeatCount(3, autoreverses: false)
                ) {
                    isAnimated.toggle()
                }
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? .red : .green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300
                )
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
                
             
            Spacer()
            
        }
    }
}

struct Animationcamp_Previews: PreviewProvider {
    static var previews: some View {
        Animationcamp()
    }
}
