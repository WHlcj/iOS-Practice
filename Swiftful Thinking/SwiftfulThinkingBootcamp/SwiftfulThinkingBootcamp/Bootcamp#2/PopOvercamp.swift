//
//  PopOvercamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/25.
//

//sheets
//animations
//transitions

import SwiftUI

struct PopOvercamp: View {
    
    @State var showNewScreen = false
    
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack {
                Button("Button") {
                    withAnimation(.spring()) {
                        showNewScreen.toggle()
                    }
                }
                .font(.largeTitle)
                Spacer()
            }
            // METHOD 1 - SHEET
//            .sheet(isPresented: $showNewScreen, content: {
//                NewScreen(showNewScreen: $showNewScreen)
//            })
            
            // METHOD 2 - TRANSITION

            ZStack {
                if showNewScreen {
                    NewScreen(showNewScreen: $showNewScreen)
                        .padding(.top, UIScreen.main.bounds.height/1.6)
                        .transition(.move(edge: .bottom))
                }
            }
            .zIndex(2)
            
            //METHOD 3 - ANIMATION OFFSET
//            NewScreen(showNewScreen: $showNewScreen)
//                .padding(.top, 100)
//                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
            
        }
    }
}

struct NewScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .ignoresSafeArea()
            
            Button(action: {
                //dismiss()
                showNewScreen.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            })
        }
    }
}

struct PopOvercamp_Previews: PreviewProvider {
    static var previews: some View {
        PopOvercamp()
    }
}
