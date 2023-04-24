//
//  BackgroundMaterials.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/3/4.
//

import SwiftUI

struct BackgroundMaterials: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Text("Hi")
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            //.background(Color.black.opacity(0.5))
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
        .ignoresSafeArea()
        .background(
            Image("girl")
        )
    }
}

struct BackgroundMaterials_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterials()
    }
}
