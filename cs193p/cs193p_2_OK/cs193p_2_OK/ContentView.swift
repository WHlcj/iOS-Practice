
import SwiftUI

struct ContentView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            topMemu
            gameBody
        }
    }
    
    var gameBody: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))],spacing: 8) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }
        .foregroundColor(EmojiMemoryGame.color)
        .padding(.horizontal)
    }
    
    var topMemu: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Memorize")
                    }
                }
                Spacer()
                Button {
                    game.restart()
                } label: {
                    Text("New Game")
                }
            }
            HStack {
                Text(EmojiMemoryGame.themeName)
                    .foregroundColor(EmojiMemoryGame.color)
                Spacer()
                HStack {
                    Image(systemName: "flag.checkered.2.crossed")
                    Text(" \(game.point)   ")
                }
                .foregroundColor(.cyan)
            }
            .font(.largeTitle)
            .padding(.top, 1)
        }
        .padding(.horizontal)
    }
    

    
    struct CardView: View {
        let card: MemoryGame<String>.Card
        
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 4)
                    Text(card.content).font(.largeTitle)
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill(Gradient(colors: [.pink,EmojiMemoryGame.color]))
                }
            }
        }
    }

}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(game: game)
    }
}

