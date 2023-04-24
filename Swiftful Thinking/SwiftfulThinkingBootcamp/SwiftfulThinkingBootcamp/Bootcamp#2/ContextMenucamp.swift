//
//  ContextMenucamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/26.
//

import SwiftUI

struct ContextMenucamp: View {
    
    @State var backgroundColor = Color.cyan
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Hi elee")
                .font(.headline)
            Text("How to use context menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(30)
        .background(backgroundColor).cornerRadius(30)
        .contextMenu(
            menuItems: {
                Button(action: {
                    backgroundColor = .yellow
                }, label: {
                    Label("Share post", systemImage: "flame.fill")
                })
                Button(action: {
                    backgroundColor = .red
                }, label: {
                    Text("Report post")
                })
                Button(action: {
                    backgroundColor = .green
                }, label: {
                    HStack {
                        Text("Delete post")
                        Image(systemName: "heart.fill")
                    }
                })
            }
        )
    }
}

struct ContextMenucamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenucamp()
    }
}
