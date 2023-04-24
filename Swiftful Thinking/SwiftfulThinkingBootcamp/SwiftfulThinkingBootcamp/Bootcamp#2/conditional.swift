//
//  conditional.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/22.
//

import SwiftUI

struct conditional: View {
    
    @State var isLoading = true
    
    var body: some View {
        VStack {
            Button("Is loading: \(isLoading.description)"){
                isLoading.toggle()
            }
            
            if isLoading {
                ProgressView()
            } else {
                
            }
            
        }
    }
}

struct conditional_Previews: PreviewProvider {
    static var previews: some View {
        conditional()
    }
}
