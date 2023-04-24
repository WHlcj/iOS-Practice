//
//  HomeScreen.swift
//  FoodPicker
//
//  Created by Changjun Li on 2023/2/17.
//

import SwiftUI

struct HomeScreen: View {
    @AppStorage(.shouldUseDarkMode) var shouldUseDarkMode = false
    @State var tab: Tab = {
        let rawValue = UserDefaults.standard.string(forKey: UserDefaults.Key.startTab.rawValue) ?? ""
        return Tab(rawValue: rawValue) ?? .picker
    }()
    
    init() {
        UITabBar.appearance()
            .backgroundColor = .secondarySystemBackground
    }

    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $tab) {
                        ForEach(Tab.allCases)
                }
                .preferredColorScheme(shouldUseDarkMode ? .dark : .light)
            }
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
