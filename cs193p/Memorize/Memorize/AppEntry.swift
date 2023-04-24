//
//  AppEntry.swift
//  Memorize
//
//  Created by 李昌骏 on 2022/10/11.
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
