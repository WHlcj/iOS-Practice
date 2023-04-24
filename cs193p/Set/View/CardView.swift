//
//  CardView.swift
//  Set
//
//  Created by Changjun Li on 2023/2/5.
//

import SwiftUI

struct CardView: View {
    typealias Card = SetCard
    var card: Card
    var borderColor: Color
    var borderWidth: CGFloat = 1.0
    
    var body: some View {
        GeometryReader { geometry in
            let itemWidth = geometry.size.height / 3 * 0.6
            ZStack{
                let cardback = RoundedRectangle(cornerRadius: CardConstents.cornerRadius)
                VStack(spacing: itemWidth / 5) {
                    ForEach(0..<card.numberOfShapes, id: \.self) { _ in
                        cardShape
                    }
                    .aspectRatio(2, contentMode: .fit)
                    .frame(width: geometry.size.width, height: itemWidth)
                }
                if card.isSelected {
                    cardback.strokeBorder(lineWidth: 10)
                        .foregroundColor(.green)
                } else {
                    cardback.strokeBorder(lineWidth: CardConstents.backBoder)
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    var cardShape: some View {
        CardShape(shape: card.shape)
            .shaded(by: card.shading, with: card.color)
            .foregroundColor(card.color)
    }
    
    struct CardShape: Shape {
        var shape: Card.Shape
        
        func path(in rect: CGRect) -> Path {
            switch shape {
            case .diamond:
                return Diamond().path(in: rect)
            case .squiggle:
                return Squiggle().path(in: rect)
            case .oval:
                return Capsule().path(in: rect)
            }
        }
        
        @ViewBuilder
        func shaded(by shading: Card.Shading, with color: Color) -> some View {
            switch shading {
            case .solid:
                self.foregroundColor(color)
            case .striped:
                self.stroke(color, lineWidth: 2.0)
            case .open:
                self.foregroundColor(color)
                    .opacity(0.5)
            }
        }
    }
}

private struct CardConstents {
    static let cornerRadius: CGFloat = 10
    static let backBoder: CGFloat = 1
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = SetCard(shading: .solid, color: .green, shape: .diamond, numberOfShapes: 3, id: 0)
        CardView(
            card: card,
            borderColor: .gray,
            borderWidth: 1.0
        )
        .frame(width: 100, height: 150, alignment: .center)
    }
}
