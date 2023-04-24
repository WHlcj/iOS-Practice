//
//  ForEachcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/21.
//

import SwiftUI

struct ForEachcamp: View {
    
    let data: [String] = ["Hi", "Hello!", "Hey Everyone"]
    let myString: String = "Hello"
    
    var body: some View {
        VStack {
            ForEach(data.indices) { index in
//                HStack {
//                    Circle()
//                        .frame(width: 30, height: 30)
//                    Text("Index is: \(index)")
//
//                }
                Text("\(data[index]): \(index)")
            }
        }
    }
}

struct ForEachcamp_Previews: PreviewProvider {
    static var previews: some View {
        ForEachcamp()
    }
}
