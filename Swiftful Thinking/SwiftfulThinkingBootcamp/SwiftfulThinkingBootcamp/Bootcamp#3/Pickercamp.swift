//
//  Pickercamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/26.
//

import SwiftUI

struct Pickercamp: View {
    
    @State var selection: Int = 0
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.cyan
        
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.white
        ]
        
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Age:")
                Text("\(selection+18)")
            }

            Picker("Picker", selection: $selection) {
                ForEach(18..<100) { number in
                    Text("\(number)")
                        .font(.headline)
                        .foregroundColor(.red)
                        .tag("\(number)")
                }
            }
            .pickerStyle(.inline)
            //.background(Color.cyan)

            Picker("Picker", selection: $selection) {
                ForEach(1..<4) { number in
                    Text("\(number)")
                        .tag("\(number)")
                }
            }
            .pickerStyle(.segmented)
            
            List {
                Picker("picker", selection: $selection) {
                    ForEach(18..<100) { number in
                        HStack {
                            Text("\(number)")
                                .tag("\(number)")
                            Image(systemName: "heart.fill")
                        }
                    }
                }
                .pickerStyle(.menu)
//                .background(Color.cyan)
            }
            
        }
    }
}

struct Pickercamp_Previews: PreviewProvider {
    static var previews: some View {
        Pickercamp()
    }
}
