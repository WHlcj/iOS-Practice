//
//  DarkModecamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/27.
//

import SwiftUI

struct DarkModecamp: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    Text("This text is primary")
                        .foregroundColor(.primary)
                    Text("This color is Secondary")
                        .foregroundColor(.secondary)
                    Text("This color is black")
                        .foregroundColor(.black)
                    Text("This color is white")
                        .foregroundColor(.white)
                    Text("This color is globally adaptive!")
                        .foregroundColor(Color("AdaptiveColor"))
                    Text("This color is locally adaptive!")
                        .foregroundColor(colorScheme == .light ? .green : .yellow)
                }
            }
            .navigationTitle("Dark Mode Camp")
        }
    }
}

struct DarkModecamp_Previews: PreviewProvider {
    static var previews: some View {
        DarkModecamp()
    }
}
