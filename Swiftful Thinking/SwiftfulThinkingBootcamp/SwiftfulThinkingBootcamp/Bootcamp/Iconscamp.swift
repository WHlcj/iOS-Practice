//
//  Iconscamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/19.
//

import SwiftUI

struct Iconscamp: View {
    var body: some View {
        Image(systemName: "heart.fill")
            //.renderingMode(.original)
            .resizable()
            //.aspectRatio(contentMode: .fit)
            //.scaledToFit()
            .scaledToFill()
            .foregroundColor(.red)
            .frame(width: 300, height: 300)
            .clipped()
    }
}

struct Iconscamp_Previews: PreviewProvider {
    static var previews: some View {
        Iconscamp()
    }
}
