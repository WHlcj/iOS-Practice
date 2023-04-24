//
//  TextFieldcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/26.
//

import SwiftUI

struct TextFieldcamp: View {
    
    @State var account = ""
    @State var key = ""
    @State var dataArray: [String] = []
    //.textFieldStyle(RoundedBorderTextFieldStyle())
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type your account here ...", text: $account)
                    .padding(15)
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.red)
                    .font(.headline)
                
                TextField("Type your key here ...", text: $key)
                    .padding(15)
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.red)
                    .font(.headline)
                
                Button(action: {
                    if textIsAppropriate() {
                        save()
                    }
                }, label: {
                    Text("Save".uppercased())
                        .padding(15)
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate() ? Color.cyan : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                })
                .disabled(!textIsAppropriate())
                
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                
                Spacer()
            }
            .padding()
            .padding(.horizontal, 5)
            .navigationTitle("TextFieldcamp")
        }
    }
    
    func textIsAppropriate() -> Bool {
        if account.count >= 3 {
            return true
        }
        return false
    }
    
    func save() {
        dataArray.append(account)
        account = ""
    }
    
}

struct TextFieldcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldcamp()
    }
}
