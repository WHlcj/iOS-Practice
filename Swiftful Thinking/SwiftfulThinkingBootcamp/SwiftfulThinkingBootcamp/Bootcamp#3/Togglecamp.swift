//
//  Togglecamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/26.
//

import SwiftUI

struct Togglecamp: View {
    
    @State var SomeFunc = false

    var body: some View {
        VStack {
            HStack {
                Text("Status:")
                Text(SomeFunc ? "Online" : "Offline")
            }
            .font(.title)

        Toggle(
            isOn: $SomeFunc,
            label: {
                Text("Lable")
            })
        .padding(.horizontal)
        .toggleStyle(SwitchToggleStyle(tint: .cyan))
        Spacer()
        }
        .padding(.horizontal)
    }
}

struct Togglecamp_Previews: PreviewProvider {
    static var previews: some View {
        Togglecamp()
    }
}
