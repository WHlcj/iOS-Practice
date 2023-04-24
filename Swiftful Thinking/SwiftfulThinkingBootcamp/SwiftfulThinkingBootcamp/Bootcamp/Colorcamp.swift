//
//  Colorcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/18.
//

import SwiftUI

struct Colorcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
//                Color(uiColor: .secondarySystemBackground)
                Color("CustomColor")
            )
            .frame(width: 300, height: 200)
            //.shadow(radius: 10)
            .shadow(color: Color("CustomColor").opacity(0.7), radius: 10, x: 20, y: 20)
            
    }
}

struct Colorcamp_Previews: PreviewProvider {
    static var previews: some View {
        Colorcamp()
    }
}
