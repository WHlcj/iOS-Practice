//
//  P&S.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/20.
//

import SwiftUI

struct P_S: View {
    var body: some View {
//        Text("Hi elee")
//            .font(.largeTitle)
//            .fontWeight(.semibold)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(.red)
//            .padding(.leading, 20)
        VStack(alignment: .leading) {
            Text("Hi elee")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("This is the description of what we will do on this screen. It is multiple lines and we will align the text to the leading edge")
        }
        .padding()
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(
                    color: .black.opacity(0.3),
                    radius: 10,
                    x: 10,
                    y: 10
                )
        )
        .padding(.horizontal)
    }
}

struct P_S_Previews: PreviewProvider {
    static var previews: some View {
        P_S()
    }
}
