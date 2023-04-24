//
//  Listcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/25.
//

import SwiftUI

struct Listcamp: View {
    @State var isEditing: EditMode = .inactive
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    @State var veggies: [String] = [
        "tomato", "potato", "carrot"
    ]
    
    
    var body: some View {
        NavigationView { // START: NAV
            List { // START: LIST
                Section(
                    header:
                        HStack {
                        Text("Fruits")
                        Image(systemName: "apple.logo")
                    }
                        .font(.headline)
                        .foregroundColor(.cyan)
                ) {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                            .font(.caption)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.pink)
                    }
//                    .onDelete(perform: { indexSet in
//                        delete(indexSet: indexSet)
//                    })
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.pink)
                }
                
                Section(
                        header:
                            HStack {
                            Text("Veggie")
                            Image(systemName: "carrot")
                        }
                            .font(.headline)
                            .foregroundColor(.cyan)
                ) {
                    ForEach(veggies, id: \.self) { veggie in
                        Text(veggie.capitalized)
                    }
                }
                
            }// END: LIST
            //.listStyle(.automatic)
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                   addButton
                }
            }
        }// END: NAV
        .tint(.cyan)
    }
    
    var addButton: some View {
        Button("Add") {
            add()
        }
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(from indices: IndexSet, to newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func add() {
        fruits.append("Coconut")
    }
    
}

struct Listcamp_Previews: PreviewProvider {
    static var previews: some View {
        Listcamp()
    }
}
