//
//  cs193p_assiment_1App.swift
//  cs193p_assiment_1
//
//  Created by Changjun Li on 2022/11/8.
//

import SwiftUI

@main
struct cs193p_assiment_1App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
