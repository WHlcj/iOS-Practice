//
//  ButtonStylecamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/3/4.
//

import SwiftUI

struct ButtonStylecamp: View {
    var body: some View {
        VStack {
            
            Button { // 1
                
            } label: {
                Text("Button Title")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            }
            .controlSize(.large)
            .buttonBorderShape(.capsule)
            .buttonStyle(.bordered) //modified the label in the button
            
            Button("Button Title") { // 2
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)
            
            Button("Button Title") { // 3
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.large)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            
            Button("Button Title") { // 4
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.mini)
            .buttonStyle(.borderedProminent)
            
            Button("Button Title") { //5
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)
        }
    }
}

struct ButtonStylecamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStylecamp()
    }
}
