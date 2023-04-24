//
//  Steppercamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/26.
//

import SwiftUI

struct Steppercamp: View {
    
    @State var stepperValue = 30
    @State var widthIncrement = 0.0
    
    
    var body: some View {
        VStack {
            Stepper("Stepper 1: \(stepperValue)", value: $stepperValue)
                .padding(50)
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100 + widthIncrement, height: 100)
            
            Stepper("Stepper 2: \(Int(widthIncrement))", onIncrement: {
                //increment
                incrementWidth(amount: 10)
            }, onDecrement: {
                //decrement
                incrementWidth(amount: -10)
            })
        }
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
    }
    
}

struct Steppercamp_Previews: PreviewProvider {
    static var previews: some View {
        Steppercamp()
    }
}
