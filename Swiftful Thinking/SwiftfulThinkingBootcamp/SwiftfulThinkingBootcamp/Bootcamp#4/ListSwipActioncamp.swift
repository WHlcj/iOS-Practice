//
//  ListSwipActioncamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/3/4.
//

import SwiftUI

struct ListSwipActioncamp: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    .swipeActions(
                        edge: .trailing,
                        allowsFullSwipe: true) {
                            Button("Archive") {
                                
                            }
                            .tint(.green)
                            Button("Save") {
                                
                            }
                            .tint(.blue)
                            Button("Junk") {
                                
                            }
                            .tint(.black)
                    }
                    .swipeActions( edge: .leading, allowsFullSwipe: true) {
                        Button("Share") {
                            
                        }
                        .tint(.yellow)
                    }
            }
            //.onDelete(perform: delete(indexSet:))
            
        }
    }
    
    func delete(indexSet: IndexSet) {
        
    }
    
}

struct ListSwipActioncamp_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipActioncamp()
    }
}
