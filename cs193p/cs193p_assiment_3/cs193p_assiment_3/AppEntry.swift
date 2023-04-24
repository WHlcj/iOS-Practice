//
//  cs193p_assiment_3App.swift
//  cs193p_assiment_3
//
//  Created by Changjun Li on 2022/12/7
//

import SwiftUI

@main
struct AppEntry: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
