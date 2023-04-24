//
//  FocusStatecamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/3/4.
//

import SwiftUI

struct FocusStatecamp: View {
    
    enum OnboardingField {
        case username
        case password
    }
    
   // @FocusState private var usernameInFocus: Bool
    @State private var username: String = ""
   // @FocusState private var passwordInFocus: Bool
    @State private var password: String = ""
    @FocusState private var fieldInFocus: OnboardingField?
    
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Add Your Name Here ...", text: $username)
                //.focused($usernameInFocus)
                .focused($fieldInFocus, equals: .username)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            SecureField("Add Your Password Here ...", text: $password)
                //.focused($passwordInFocus)
                .focused($fieldInFocus, equals: .password)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            Button("Sign Up 🚀") {
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                if usernameIsValid && passwordIsValid {
                    print("Sign Uo")
                } else if usernameIsValid {
//                    usernameInFocus = false
//                    passwordInFocus = true
                    fieldInFocus = .password
                } else {
                    fieldInFocus = .username
//                    usernameInFocus = true
//                    passwordInFocus = false
                }
            }
            
//            Button("Toggle Focus State") {
//                usernameInFocus.toggle()
//            }
        }
        .padding(40)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                fieldInFocus = .username
            })
        }
    }
}

struct FocusStatecamp_Previews: PreviewProvider {
    static var previews: some View {
        FocusStatecamp()
    }
}
