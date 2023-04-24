//
//  Framecamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/19.
//

import SwiftUI

struct Framecamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(.red)
            .frame(height: 100, alignment: .top)
            .background(.orange)
            .frame(width: 150)
            .background(.purple)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.red)
            .frame(height: 300)
            .background(.green)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(.blue)
        
    }
}

struct Framecamp_Previews: PreviewProvider {
    static var previews: some View {
        Framecamp()
    }
}
