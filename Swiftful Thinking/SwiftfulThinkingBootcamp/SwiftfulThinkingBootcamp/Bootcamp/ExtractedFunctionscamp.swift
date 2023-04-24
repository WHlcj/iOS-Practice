//
//  ExtractedFunctionscamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/22.
//

import SwiftUI

struct ExtractedFunctionscamp: View {
    
    @State var backgroundColor = Color.pink
    
    var body: some View {
        ZStack {
            //background
            backgroundColor
                .ignoresSafeArea()
            
            //content
            contentLayer
        }
    }
    
    var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            Button(action: {
                buttonPressed()
            }, label: {
                Text("Press me")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
            })
        }
    }
    
    func buttonPressed() {
        backgroundColor = .yellow
    }
    
}

struct ExtractedFunctionscamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedFunctionscamp()
    }
}
