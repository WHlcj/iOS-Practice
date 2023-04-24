//VM part of the game

import SwiftUI

class SoloSetGame: ObservableObject {
    typealias Card = SetCard
    
    static func creatSetGame() -> SetGame { SetGame() }
    
    @Published private var model = creatSetGame()
    
    var score: Int {
        model.score
    }
    
    var cards: [Card] {
        model.cards
    }
    
    var openCards: [Card] {
        model.openCards
    }
    //MARK: -Intent(s)
    func newGame() {
        model = SoloSetGame.creatSetGame()
    }
    
    func dealMoreCards() {
        model.dealMoreCards()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    
}


