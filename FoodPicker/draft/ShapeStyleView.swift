//
//  ShapeStyleView.swift
//  FoodPicker
//
//  Created by Changjun Li on 2023/2/11.
//

import SwiftUI

struct ShapeStyleView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle().fill(.yellow)
                Circle().fill(.image(.init("dinner"), scale: 0.3))
                Text("Hello")
                    .font(.system(size: 100).bold())
                    .foregroundStyle(.linearGradient(colors: [.pink, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .shadow(color: .white, radius: 10)
                    .shadow(color: .white, radius: 10)
                    .shadow(color: .white, radius: 10)
            }
            ZStack {
 
                Circle().fill(.linearGradient(colors: [.pink, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                Text("Hello")
                    .font(.system(size: 100).bold())
                    .foregroundStyle(.linearGradient(colors: [.pink, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .background {
                        Color.bg2
                            .scaleEffect(x: 1.5, y: 1.3)
                            .blur(radius: 20)
                    }
            }
        }
        
    }
}

struct ShapeStyleView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeStyleView()
    }
}
