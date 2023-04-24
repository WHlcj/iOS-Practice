//
//  Statecamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/22.
//

import SwiftUI

struct Statecamp: View {
    
    @State var backgroundColor: Color = Color.green
    @State var myTitle: String = "My Title"
    @State var count = 0
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("Button1") {
                        backgroundColor = .red
                        myTitle = "Button 1 was pressed"
                        count += 1
                    }
                    
                    Button("Button2") {
                        backgroundColor = .purple
                        myTitle = "Button 2 was pressed"
                        count -= 1
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct Statecamp_Previews: PreviewProvider {
    static var previews: some View {
        Statecamp()
    }
}
