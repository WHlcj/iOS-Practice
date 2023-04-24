
import SwiftUI

struct Themes {
    let vehicles = ["🛵","🚀","✈️","🚌","🚜","🚲","🚝","🚁","🚤","🚢","🚡","🛥","🚇","🚟","🚔","🚑","🚒"]
    let halloweens = ["😈","🤡","☠️","👻","🎃","🦇","🕸️","🕯️","👾","🌘"]
    let animals = ["🐶","🐱","🐭","🐰","🦊","🐻","🐯","🐮","🐷","🐸","🐵","🐔","🐦","🐴","🐢","🐍","🐠","🐳","🐬","🐘","🐏","🐉"]
    let clothings = ["🧶","🧵","🧥","🥼","🦺","👚","👖","🩳","👔","👗","👙","👘","🩴","🧢","🧦","👒","👑","👜","🎒","👠","⛑️","🧳"]
    
    private(set) var emojis: [String]
    private(set) var themeName: String
    private(set) var color: Color
    private(set) var emojiNumber: Int
    
    init() {
        emojis = [vehicles,halloweens,animals,clothings].randomElement()!
        switch emojis {
        case clothings:
            themeName = "clothings"
            color = .blue
            emojiNumber = 6
        case halloweens:
            themeName = "halloweens"
            color = .orange
            emojiNumber = 6
        case animals:
            themeName = "animals"
            color = .brown
            emojiNumber = 6
        default:
            themeName = "vehicles"
            color = .red
            emojiNumber = Int.random(in: 4 ..< 10)
        }
    }
    
    
}
