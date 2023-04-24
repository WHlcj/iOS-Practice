//
//  Buttoncamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/22.
//

import SwiftUI

struct Buttoncamp: View {
    
    @State var title: String = "This is my title"
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
            
            Button("Press me!") {
                self.title = "Button was pressed"
            }
            .accentColor(.red)
            
            Button(action: {
                self.title = "Button #2 was pressed"
            }, label: {
                Text("Sava".uppercased())
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
            })
            
            Button(action: {
                self.title = "Button #3"
            }, label: {
                Circle()
                    .fill(.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    )
            })
            
            Button(action: {
                self.title = "Button #4"
            }, label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(.gray, lineWidth: 3.0)
                    )
            })
        }
    }
}

struct Buttoncamp_Previews: PreviewProvider {
    static var previews: some View {
        Buttoncamp()
    }
}
