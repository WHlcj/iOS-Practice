
import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    private(set) var point = 0
    private(set) var startTime: Date
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        
        func interval(_ date:Date) -> Int {
            let now = Date()
            let min = "mm"
            let seconds = "ss"
            let hour = "hh"
            let formatter1 = DateFormatter()
            let formatter2 = DateFormatter()
            let formatter3 = DateFormatter()
            formatter1.dateFormat = hour
            formatter2.dateFormat = min
            formatter3.dateFormat = seconds
            var interval = (Int(formatter1.string(from: now))!-Int(formatter1.string(from: date))!) * 3600 +
        (Int(formatter2.string(from: now))! * 60 + Int(formatter3.string(from: now))!) - (Int(formatter2.string(from: date))! * 60 + Int(formatter3.string(from: date))!)
            if interval > 6 {
                interval = 6
            }
            return interval
        }
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
//                    cards.remove(at: chosenIndex)
//                    cards.remove(at: potentialMatchIndex)
                    
                    point += 10 + (6 - interval(startTime)) * 2
                    startTime = Date()
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                if cards[chosenIndex].isFacedUp == true {
                    point -= 2
                }
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
            cards[chosenIndex].isFacedUp = true
        }
    }
    
    
    init(numberOfPairsOfCardfs: Int, creatCardContent: (Int) -> CardContent) {
        startTime = Date()
        cards = Array<Card>()
        //add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCardfs {
            let content = creatCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        
        var isFaceUp: Bool = false
        var isFacedUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
