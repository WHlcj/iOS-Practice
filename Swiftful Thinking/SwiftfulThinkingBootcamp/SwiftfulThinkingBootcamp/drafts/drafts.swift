//
//  drafts.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/22.
//

import SwiftUI

struct drafts: View {
    
   private let coffee = ["Espresso", "Latte", "Cappuccino", "Americano"]
   
   @State private var selectedCoffee = ""
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.cyan
        
        
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }

   var body: some View {
       VStack {
           Text("☕ You choose: \(selectedCoffee)")
                           .font(.title2)
           Picker("Please choose a coffee", selection: $selectedCoffee) {
               ForEach(coffee, id: \.self) {
                   Text($0)
               }
           }
           .frame(width: 400.0, height: 100.0)
           .pickerStyle(.segmented)
           
           
       }
   }
}

struct drafts_Previews: PreviewProvider {
    static var previews: some View {
        drafts()
    }
}
