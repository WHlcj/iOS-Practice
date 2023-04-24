//
//  ExSubviewcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/22.
//

import SwiftUI

struct ExSubviewcamp: View {
    
    
    var body: some View {
        
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            contentLayer
        }
    }
   
    var contentLayer: some View {
        HStack {
            MyItem(color: .orange, title: "Oranges", count: 10)
            MyItem()
            MyItem(color: .yellow, title: "Banans", count: 10)
        }
    }
    
}

struct ExSubviewcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExSubviewcamp()
    }
}

struct MyItem: View {
    
    @State var color: Color = Color.green
    @State var title: String = "My Title"
    @State var count = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}
