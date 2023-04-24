//
//  TapGesturecamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/28.
//

import SwiftUI

struct TapGesturecamp: View {
    
    @State var isSelected = false
    
    var body: some View {
        VStack(spacing: 40) {
            
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 200)
                .foregroundColor(isSelected ? Color.green : Color.red)
            
            Button(action: {
                isSelected.toggle()
            }, label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
            })
            
            Text("Tap Gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(25)
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture( count: 2, perform: {
                    isSelected.toggle()
                })
            
            Spacer()
        }
        .padding(40)
    }
}

struct TapGesturecamp_Previews: PreviewProvider {
    static var previews: some View {
        TapGesturecamp()
    }
}
