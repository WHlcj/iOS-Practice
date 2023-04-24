//
//  AppStoragecamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/3/3.
//

import SwiftUI

struct AppStoragecamp: View {
    
    //@State var currentUserName: String?
    @AppStorage("name") var currentUserName: String?
        
    var body: some View {
        VStack(spacing: 20) {
            //Text(currentUserName ?? "Add Name Here")
            if let currentUserName {
                Text(currentUserName)
            }
            
            Button("Save".uppercased()) {
                let name = "EnderLee"
                currentUserName = name
               // UserDefaults.standard.set(name, forKey: "name")
            }
        }
//        .onAppear {
//            currentUserName = UserDefaults.standard.string(forKey: "name")
//        }
    }
}

struct AppStoragecamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStoragecamp()
    }
}
