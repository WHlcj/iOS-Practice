//
//  Imagecamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/19.
//

import SwiftUI

struct Imagecamp: View {
    var body: some View {
        Image("girl")
//           .renderingMode(.template)
//           .foregroundColor(.red)
            .resizable()
            .scaledToFit()
            .frame(width: 500)
        
       
            .clipShape(
                Circle()
            )
    }
}

struct Imagecamp_Previews: PreviewProvider {
    static var previews: some View {
        Imagecamp()
    }
}
