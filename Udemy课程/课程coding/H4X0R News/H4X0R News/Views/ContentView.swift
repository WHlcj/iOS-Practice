//
//  ContentView.swift
//  H4X0R News
//
//  Created by Changjun Li on 2023/7/8.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationStack {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4X0R NEWS")
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
    
}


// Components


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


