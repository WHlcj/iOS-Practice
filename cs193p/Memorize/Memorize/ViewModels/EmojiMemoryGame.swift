
//ViewModel Of Memorize

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🛵","🚀","✈️","🚌","🚜","🚲","🚝","🚁","🚤","🚢","🚡","🛥","🚇","🚟","🚔","🚑","🚒"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards:10) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    // or private(set) var model: MemoryGame<String> = createMemoryGame()
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.Choose(card)
    }
    
    func shuffle() {
        model.Shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }

}




