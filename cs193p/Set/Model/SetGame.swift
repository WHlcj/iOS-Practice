//M part of the project

import Foundation
import SwiftUI

struct SetGame {
    typealias Card = SetCard
    
    private(set) var cards: [Card] = []
    private(set) var openCards: [Card] = []
    private(set) var numberOfPlayingCards: Int = 12
    private(set) var score = 0
    
    private(set) var selectedCard: Array<Card> {
        didSet {
            if selectedCard.count == 3 {
                if match(card1: selectedCard[0], card2: selectedCard[1], card3: selectedCard[2]) {
                    score += 1
                    for card in selectedCard {
                        if let index = openCards.firstIndex(where: { $0.id == card.id }) {
                            openCards.remove(at: index)
                        }
                    }
                } else {
                    score -= 1
                }
                for n in 0...2 {
                    if let chosenIndex = openCards.firstIndex(where: { $0.id == selectedCard[n].id}) {
                        openCards[chosenIndex].isSelected.toggle()
                    }
                }
                selectedCard = []
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = openCards.firstIndex(where: { $0.id == card.id}) {
            openCards[chosenIndex].isSelected.toggle()
        }
        if let chosenIndex = selectedCard.firstIndex(where: { $0.id == card.id}){
            selectedCard.remove(at: chosenIndex)
        } else {
            selectedCard.append(card)
        }
    }
    
    mutating func dealMoreCards() {
        for _ in 0...2 {
            openCards.append(cards[0])
            cards.remove(at: 0)
        }
    }
    
    init() {
        selectedCard = []
        cards = []
        var pairIndex = 1
        for shading in Card.Shading.allCases {
            for color in [Color.red,Color.green,Color.purple] {
                for shape in Card.Shape.allCases {
                    for number in 1...3 {
                        cards.append(Card(shading: shading, color: color, shape: shape, numberOfShapes: number, id: pairIndex))
                        pairIndex += 1
                    }
                }
            }
        }
        cards.shuffle()
        for _ in 0...13 {
            let card = cards[0]
            openCards.append(card)
            cards.remove(at: 0)
        }
    }
    
    
    
    
    // MARK: - Private methods
    
    //check whether the three selected cards are matched or not
    private func match(card1: Card, card2: Card, card3: Card) -> Bool {
        let color = (card1.color == card2.color && card2.color == card3.color) || (card1.color != card2.color && card1.color != card3.color && card2.color != card3.color)
        let shape = (card1.shape == card2.shape && card2.shape == card3.shape) || (card1.shape != card2.shape && card1.shape != card3.shape && card2.shape != card3.shape)
        let numberOfShapes = (card1.numberOfShapes == card2.numberOfShapes && card2.numberOfShapes == card3.numberOfShapes) || (card1.numberOfShapes != card2.numberOfShapes && card1.numberOfShapes != card3.numberOfShapes && card2.numberOfShapes != card3.numberOfShapes)
        let shading = (card1.shading == card2.shading && card2.shading == card3.shading) || (card1.shading != card2.shading && card1.shading != card3.shading && card2.shading != card3.shading)
        
        return color && shape && numberOfShapes && shading
    }
    

}
