//
//  TextEditorcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/26.
//

import SwiftUI

struct TextEditorcamp: View {
    
    @State var account = "Input your account"
    @State var key = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $account)
                    .frame(height: 250)
                    .cornerRadius(10)
                    .colorMultiply(Color.red)
                Button(action: {
                    key = account
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.cyan)
                        .cornerRadius(10)
                })
                Text(key)
                Spacer()
            }
            .padding()
           // .background(Color.green)
            .navigationTitle("TextEditorcamp")
        }
    }
}

struct TextEditorcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorcamp()
    }
}
