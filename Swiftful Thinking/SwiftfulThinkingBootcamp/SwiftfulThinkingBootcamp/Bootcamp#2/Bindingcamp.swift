//
//  Bindingcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/22.
//

import SwiftUI

struct Bindingcamp: View {
    
    @State var backgroundColor = Color.green
    @State var title: String = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
            
        }
    }
}

struct ButtonView: View {
    
    @Binding var backgroundColor: Color
    @Binding var title: String
    @State var buttonColor: Color = Color.blue
    
    var body: some View {
        Button(action: {
            backgroundColor = .orange
            buttonColor = .pink
            title = "New title"
        }, label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        })
    }
    
}

struct Bindingcamp_Previews: PreviewProvider {
    static var previews: some View {
        Bindingcamp()
    }
}
