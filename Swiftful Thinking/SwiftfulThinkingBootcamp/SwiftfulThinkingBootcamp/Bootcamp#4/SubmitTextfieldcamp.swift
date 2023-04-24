//
//  SubmitTextfieldcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/3/4.
//

import SwiftUI

struct SubmitTextfieldcamp: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextField("Placeholder...", text: $text)
            .submitLabel(.route)
            .onSubmit {
                print("Something to the console!")
            }
        
        TextField("Placeholder...", text: $text)
            .submitLabel(.next)
            .onSubmit {
                print("Something to the console!")
            }
        
        TextField("Placeholder...", text: $text)
            .submitLabel(.search)
            .onSubmit {
                print("Something to the console!")
            }
    }
}

struct SubmitTextfieldcamp_Previews: PreviewProvider {
    static var previews: some View {
        SubmitTextfieldcamp()
    }
}
