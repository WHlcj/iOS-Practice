//
//  Badgescamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/3/4.
//

import SwiftUI

// List
// TabView

struct Badgescamp: View {
    var body: some View {
        
        List {
            Text("Hello, world!")
                .badge(5)
            Text("Hello, world!")
                .badge("New Info")
            Text("Hello, world!")
        }
//        TabView {
//            Color.red.tabItem {
//                Image(systemName: "heart.fill")
//                Text("Hello")
//            }
//            .badge(10)
//
//            Color.green.tabItem {
//                Image(systemName: "heart.fill")
//                Text("Hello")
//            }
//            .badge("New")
//
//            Color.cyan.tabItem {
//                Image(systemName: "heart.fill")
//                Text("Hello")
//            }
//        }
    }
}

struct Badgescamp_Previews: PreviewProvider {
    static var previews: some View {
        Badgescamp()
    }
}
