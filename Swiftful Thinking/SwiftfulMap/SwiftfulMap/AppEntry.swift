//
//  SwiftfulMapApp.swift
//  SwiftfulMap
//
//  Created by Changjun Li on 2023/3/27.
//

import SwiftUI

@main
struct AppEntry: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
