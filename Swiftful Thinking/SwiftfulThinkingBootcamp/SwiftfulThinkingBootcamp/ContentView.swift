//
//  ContentView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/18.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 100
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
     
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
