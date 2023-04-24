//V part of the game

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game: SoloSetGame
    
    var body: some View {
        VStack {
            topMenu
            openCards
            buttomMenu
        }
        .padding(.horizontal)
    }
    
    var topMenu: some View {
        HStack {
            Spacer()
            HStack {
                Image(systemName: "flag.checkered.2.crossed")
                Text("\(game.score)")
            }
            .font(.largeTitle)
            .foregroundColor(.cyan)
        }
    }
    
    var openCards: some View {
        GeometryReader { geometry in
            AspectVGrid(items: game.openCards, aspectRatio: DrawingConstents.aspectRatio) { card in
                    CardView(
                        card: card,
                        borderColor: .gray,
                        borderWidth: 1
                    )
                .onTapGesture {
                    game.choose(card)
                }
            }
        }
    }
    
    var buttomMenu: some View {
        HStack {
            Button {
                game.dealMoreCards()
            } label: {
                Text("Deal More Cards!")
            }
            Spacer()
            Button {
                game.newGame()
            } label: {
                Text("New Game")
            }
        }
        .font(.title)
        .padding(.horizontal)
    }
    

}

private struct DrawingConstents {
    static let cornerRadius: CGFloat = 15
    static let aspectRatio: CGFloat = 2 / 3
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SoloSetGame()
        SetGameView(game: game)
    }
}
