//
//  Transitioncamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/25.
//

import SwiftUI

struct Transitioncamp: View {
    
    @State var showView = false
    
    var body: some View {
        ZStack(alignment: .bottom) { // START: ZS
            
            VStack {
                Button("Button") {
                    withAnimation(.easeInOut) {
                        showView.toggle()
                    }
                }
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.asymmetric(
                        insertion: .move(edge: .bottom),
                        removal: AnyTransition.opacity.animation(.easeInOut)))
                    //.transition(.move(edge: .bottom))
                    //.transition(AnyTransition.scale.animation(.easeInOut))
                    //.transition(AnyTransition.opacity.animation(.easeInOut))
                    //.transition(.slide)
                    //.animation(.easeInOut)
            }

        }// END: ZS
        .ignoresSafeArea(edges: .bottom)
    }
}

struct Transitioncamp_Previews: PreviewProvider {
    static var previews: some View {
        Transitioncamp()
    }
}
