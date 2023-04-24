//
//  SafeAreacamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/21.
//

import SwiftUI

struct SafeAreacamp: View {
    var body: some View {
        
        ScrollView {
            VStack {
                Text("Hi elee")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding(20)
                }
            }
        }
        .background(
            Color.red
                .ignoresSafeArea(edges: .bottom)
        )
        
        
//        ZStack {
//            // background
//            Color.blue
//                .edgesIgnoringSafeArea(.all)
//
//            //foreground
//            VStack {
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                Spacer()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.red)
//        }
           // .edgesIgnoringSafeArea(.top)
    }
}

struct SafeAreacamp_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreacamp()
    }
}
