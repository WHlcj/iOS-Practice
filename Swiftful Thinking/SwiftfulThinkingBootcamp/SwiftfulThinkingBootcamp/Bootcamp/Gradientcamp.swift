//
//  Gradientcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/19.
//

import SwiftUI

struct Gradientcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                //.red
//                LinearGradient(
//                    gradient: Gradient(colors: [.red, .orange, .blue, .purple]),
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
                RadialGradient(
                    gradient: Gradient(colors: [ .red, .blue]),
                    center: .topLeading,
                    startRadius: 5,
                    endRadius: 400)
//               AngularGradient(
//                gradient: Gradient(colors: [ .red, .blue]),
//                center: .topLeading,
//                angle: .degrees(180))
                
            )
            .frame(width: 300, height: 200)
        
    }
}

struct Gradientcamp_Previews: PreviewProvider {
    static var previews: some View {
        Gradientcamp()
    }
}
