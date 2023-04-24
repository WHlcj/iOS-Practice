//
//  Sheetscamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/25.
//

import SwiftUI

struct Sheetscamp: View {
    
    @State var showSheet = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea(.all)
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
            })
            
            // MARK: fullScreenCover OR sheet only can use one in every screen
            .fullScreenCover(isPresented: $showSheet, content: {
                SecondScreen()
            })
//            .sheet(isPresented: $showSheet, content: {
//              //  DO NOT ADD CONDITIONAL LOGIC
//                SecondScreen()
//            })
        }
    }
}

struct SecondScreen: View {
      @Environment(\.dismiss) var presentationMode
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .ignoresSafeArea(.all)
            
            Button(action: {
                presentationMode()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            })
        }
    }
}

struct Sheetscamp_Previews: PreviewProvider {
    static var previews: some View {
        Sheetscamp()
        //SecondScreen()
    }
}
