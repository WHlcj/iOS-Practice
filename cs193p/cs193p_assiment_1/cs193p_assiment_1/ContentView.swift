
import SwiftUI

struct ContentView: View {
    
    let emojis = ["🛵","🚀","✈️","🚌","🚜","🚲","🚝","🚁","🚤","🚢","🚡","🛥","🚇","🚟","🚔","🚑","🚒"]
    
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                Button {
                    if emojiCount > 1 {
                        emojiCount -= 1
                    }
                } label: {
                    Image(systemName: "minus.circle")
                }
                Spacer()
                Button(action: {
                    if emojiCount < emojis.count {
                        emojiCount += 1
                    }
                }, label: {
                    Image(systemName: "plus.circle")})
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        
        .padding()
    }
    

    
    struct CardView: View {
        var content: String
        
        @State var isFaceUp: Bool = true
        
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 4)
                    Text(content).font(.largeTitle)
                } else {
                    shape.fill()
                }
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }

}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

