//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Changjun Li on 2023/3/22.
//

import SwiftUI

/*
  MVVM Architecture
 
  Model - data point
  View - UI
  ViewModel - manages Models for View
 
 */

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            //.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
