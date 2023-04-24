//
//  TabViewTest.swift
//  FoodPicker
//
//  Created by Changjun Li on 2023/2/18.
//

import SwiftUI

struct TabViewTest: View {
    init() {
        UITabBar.appearance()
            .backgroundColor = .systemGray5

    }
    
    var body: some View {
        ZStack {
 
            TabView {
                Text("111111").tabItem{
                    Label("Home", systemImage: .house)
                }
            }
//            VStack{
//                Spacer()
//                Rectangle()
//                    .frame(maxWidth: .infinity, maxHeight: 13)
//                  .foregroundColor(Color(.systemGray5))
//                  .padding(.bottom, 43)
//            }
    
        }
    }
}

struct TabViewTest_Previews: PreviewProvider {
    static var previews: some View {
        TabViewTest()
    }
}
