//
//  Slidercamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/27.
//

import SwiftUI

struct Slidercamp: View {
    
    @State private var score: Double = 5.0
    @State private var color = Color.red
    //@State private var isEditing = false
    
    var body: some View {
        VStack {
            Text("Your score:  " + String(format: "%.1f", score))
                .foregroundColor(color)
                //.foregroundColor(isEditing ? .red : .blue)
            //Slider(value: $score)
            //Slider(value: $score, in: 0...100)
            //Slider(value: $score, in: 1...5, step: 0.5)
            Slider(
                value: $score,
                in: 0...5,
                step: 0.5,
                onEditingChanged: { editing in
                    color = Color.green
                    //isEditing = editing
                },
                minimumValueLabel:
                    Text("1")
                    .font(.largeTitle)
                    .foregroundColor(.orange),
                maximumValueLabel: Text("5"),
                label: {
                    Text("Title")
                })
                .tint(.cyan)
                .padding(.horizontal, 50)
        }
    }
}

struct Slidercamp_Previews: PreviewProvider {
    static var previews: some View {
        Slidercamp()
    }
}
