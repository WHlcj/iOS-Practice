
import SwiftUI

struct ContentView: View {
    
    let vehicles = ["🛵","🚀","✈️","🚌","🚜","🚲","🚝","🚁","🚤","🚢","🚡","🛥","🚇","🚟","🚔","🚑","🚒"]
    let halloweens = ["😜","🥳","🤯","😈","🤡","👺","☠️","👻","🎃","🤖","🦇","🕸️","🕯️","👾","🌘"]
    let animals = ["🐶","🐱","🐭","🐰","🦊","🐻","🐯","🐮","🐷","🐸","🐵","🐔","🐦","🐴","🐢","🐍","🐠","🐳","🐬","🐘","🐏","🐉"]
    let clothings = ["🧶","🧵","🧥","🥼","🦺","👚","👖","🩳","👔","👗","👙","👘","🩴","🧢","🧦","👒","👑","👜","🎒","👠","⛑️","🧳"]
    
    @State var emojis: [String] = ["🛵","🚀","✈️","🚌","🚜","🚲","🚝","🚁","🚤","🚢","🚡","🛥","🚇","🚟","🚔","🚑","🚒"]
    
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            Spacer(minLength: 5)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70,maximum: 200))],spacing: 8) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                vehicle
                Spacer()
                halloween
                Spacer()
                animal
                Spacer()
                clothing
            }
            .padding(.horizontal)
        }
        .padding()
    }
    

    var vehicle: some View {
        Button {
            emojis = []
            var num: [Int] = []
            while emojis.count < emojiCount {
                let item = Int.random(in: 0..<vehicles.count)
                if !num.contains(item) {
                    num.append(item)
                    emojis.append(vehicles[item])
                }
            }
        } label: {
            VStack {
                Image(systemName: "car").font(.largeTitle)
                Text("vehicle")
            }
        }
    }
    
    var halloween: some View {
        Button {
            emojis = halloweens.shuffled()
        } label: {
            VStack {
                Image(systemName: "moon.stars").font(.largeTitle)
                Text("halloween")
            }
        }
    }
    
    var animal: some View {
        Button {
            emojis = animals.shuffled()
        } label: {
            VStack {
                Image(systemName: "pawprint.circle.fill").font(.largeTitle)
                Text("animal")
            }
        }
    }
    
    var clothing: some View {
        Button {
            emojis = clothings.shuffled()
        } label: {
            VStack {
                Image(systemName: "tshirt").font(.largeTitle)
                Text("clothing")
            }
        }
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
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone Xs"))
    }
        
}
