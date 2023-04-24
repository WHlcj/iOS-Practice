
import SwiftUI

@main
struct cs193p_assiment_1App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
        }
    }
}
