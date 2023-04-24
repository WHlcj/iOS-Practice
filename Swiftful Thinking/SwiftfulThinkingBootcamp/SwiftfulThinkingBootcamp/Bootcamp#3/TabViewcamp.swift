//
//  TabViewcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/27.
//

import SwiftUI

struct TabViewcamp: View {
    
    @State private var selectedTab = 2
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            Text("Browse Tab")
                .tabItem {
                    Label("Browse", systemImage: "globe")
                }
                .tag(1)
            
            Text("Profile Tab")
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(2)
        }
        .tint(.cyan)
    }
}

struct TabViewcamp2: View {
    
    @State private var selectedTab = 2
    
    let icons: [String] = [
        "heart.fill", "globe", "house.fill", "person.fill"
    ]
    
    var body: some View {
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
        }
        .background(
            RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center, startRadius: 5, endRadius: 300)
        )
        .frame(height: 300)
        .tabViewStyle(.page)
    }
}

struct TabViewcamp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewcamp2()
    }
}

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea(edges: .top)
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button(action: {
                    selectedTab = 2
                }, label: {
                    Text("Go to profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10)
                })
            }
        }
    }
}
