//
//  Stackscamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/20.
//

import SwiftUI
//When it is simple use the background and overlay.
struct Stackscamp: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Items in yours cart:")
                .font(.caption)
                .foregroundColor(.gray)
            Text("5")
                .font(.largeTitle)
                .underline()
        }
        
        VStack(spacing: 50) {
            
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                
                Text("1")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            Text("1")
                .font(.title)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 100, height: 100)
                )
        }
    }
}

struct Stackscamp_Previews: PreviewProvider {
    static var previews: some View {
        Stackscamp()
    }
}
