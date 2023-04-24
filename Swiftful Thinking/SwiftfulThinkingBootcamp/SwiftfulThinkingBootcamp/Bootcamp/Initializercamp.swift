//
//  Initializercamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/21.
//

import SwiftUI

struct Initializercamp: View {
    
    let backgroundColor: Color
    let count: Int
    let title: String
    
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        if fruit == .apple {
            self.title = "Apples"
            self.backgroundColor = .red
        } else {
            self.title = "Oranges"
            self.backgroundColor = .orange
        }
    }
    
    enum Fruit {
        case apple
        case orange
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
        
    }
}

struct Initializercamp_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Initializercamp(count: 100, fruit: .apple)
            Initializercamp(count: 55, fruit: .orange)
        }
    }
}
