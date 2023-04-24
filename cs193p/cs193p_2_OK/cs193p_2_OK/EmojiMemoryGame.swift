
import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    static var theme = Themes()
    
    static var themeName = theme.themeName
    
    static var emojis = theme.emojis
    
    static var color = theme.color
    
    static var emojiNumber = theme.emojiNumber
    
    static func createMemoryGame() -> MemoryGame<String> {
        let defNumber = 10
        let actNumber = emojiNumber > defNumber ? defNumber : emojiNumber
        
        return MemoryGame<String>(numberOfPairsOfCardfs: actNumber) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var point: Int {
        model.point
    }
    
    //MARK: -Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func restart() {
        EmojiMemoryGame.theme = Themes()
        EmojiMemoryGame.themeName = EmojiMemoryGame.theme.themeName
        EmojiMemoryGame.emojis = EmojiMemoryGame.theme.emojis
        EmojiMemoryGame.color = EmojiMemoryGame.theme.color
        EmojiMemoryGame.emojiNumber = EmojiMemoryGame.theme.emojiNumber
        model = EmojiMemoryGame.createMemoryGame()
    }
}

