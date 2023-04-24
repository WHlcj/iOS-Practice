//
//  IfLetGuard.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/28.
//

import SwiftUI

struct IfLetGuard: View {
    
    @State var currentUserID: String? = "elee"
    @State var displayText: String? = nil
    @State var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here we are practicing safe coding!")
                
                if let text = displayText {
                    Text(text)
                        .font(.title)
                }
                
                // DO NOT USE ! EVER!!
                // DO NOT FORCE UNWRAP VALUES
                //Text(displayText!)
                
                if isLoading {
                    ProgressView()
                }
                Spacer()
            }
            .navigationTitle("Safe Coding")
            .onAppear {
                loadData2()
            }
        }
    }
    
    func loadData() {
        
        if let userID = currentUserID {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                displayText = "This is the new data! User id is \(userID)"
                isLoading = false
            })
        } else {
            displayText = "Error. There is no User ID!"
        }
    }
    
    func loadData2() {
        
        guard let userID = currentUserID else {
            displayText = "Error. There is no User ID!"
            return
        }
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            displayText = "This is the new data! User id is \(userID)"
            isLoading = false
        })
    }
}

struct IfLetGuard_Previews: PreviewProvider {
    static var previews: some View {
        IfLetGuard()
    }
}
