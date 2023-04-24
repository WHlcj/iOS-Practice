//
//  B&O.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/19.
//

import SwiftUI

struct B_O: View {
    var body: some View {
        VStack {
            HStack {
    //            Text("Hi elee!")
    //                .frame(width: 100, height: 100)
    //                .background(
    //                    Circle()
    //                        .fill(LinearGradient(colors: [.cyan, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    //                )
    //                .frame(width: 150, height: 150)
    //                .background(
    //                    Circle()
    //                        .fill(.green),
    //                    alignment: .bottomTrailing
    //                )
                Rectangle()
                    .frame(width: 100, height: 100)
                    .overlay(
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 50, height: 50),
                        alignment: .topLeading
                    )
                    .background(
                        Rectangle()
                            .fill(.red)
                            .frame(width: 150, height: 150),
                        alignment: .bottomTrailing
                    )
                
                Circle()
                    .fill(.green)
                    .frame(width: 150, height: 150)
                    .overlay(
                        Circle()
                            .fill(LinearGradient(colors: [.cyan, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 100, height: 100)
                            .overlay(Text("Hi elee!")),
                        alignment: .topLeading
                    )
            }
            Image(systemName: "heart.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.pink, .purple]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                        )
                        .frame(width: 100, height: 100)
                        .shadow(color: .purple, radius: 10, x: 0, y: 10)
                        .overlay(
                            Circle()
                                .fill(.blue)
                                .frame(width: 35, height: 35)
                                .overlay(
                                    Text("5")
                                        .foregroundColor(.white)
                                )
                                .shadow(color: .purple, radius: 10, x: 5, y: 5)
                            , alignment: .bottomTrailing
                        )
                )
        }
    }
}

struct B_O_Previews: PreviewProvider {
    static var previews: some View {
        B_O()
    }
}
