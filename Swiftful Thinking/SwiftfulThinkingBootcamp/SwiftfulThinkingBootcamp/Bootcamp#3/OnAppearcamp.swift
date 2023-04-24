//
//  OnAppearcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/28.
//

import SwiftUI

struct OnAppearcamp: View {
    
    @State var myText: String = "Start text."
    @State var count = 0
    
    var body: some View {
        NavigationView{
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    myText = "This is a new text!"
                })
            })
            // usually do some data clear etr
            .onDisappear(perform: {
                myText = "Ending text"
            })
            .navigationTitle("On Appear: \(count)")
        }
    }
}

struct OnAppearcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearcamp()
    }
}
