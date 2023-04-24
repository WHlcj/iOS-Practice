//
//  ViewModelcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/28.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id:String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Bananas", count: 3)
        let fruit3 = FruitModel(name: "Watermelon", count: 88)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }
        
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}


struct ViewModelcamp: View {

    //@StateObject -> USE THIS ON CREATION / INIT
    //@ObservedObject -> USE THIS FOR SUBVIEWS
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        
                        HStack{
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit(index: ))
                }
            }
            .navigationTitle("Fruit List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink (
                        destination: RandomScreen(fruitViewModel: fruitViewModel),
                        label:    {
                            Image(systemName: "arrow.right")        .font(.title2)
                        }
                    )
                }
            }
//            .onAppear {
//                    fruitViewModel.getFruits()
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
//                myText = "This is a new text!"
//            })
        }
    }
}

struct RandomScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            
            VStack{
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
        }
    }
    
}

struct ViewModelcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelcamp()
        //RandomScreen()
    }
}
