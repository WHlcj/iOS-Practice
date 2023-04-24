//
//  CustomDatacamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/28.
//

import SwiftUI

// MARK: User Model
struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}


struct CustomDatacamp: View {
    
    @State var users: [UserModel] = [
        //"Nick", "Emily", "Samantha", "Chris"
        UserModel(displayName: "Nick", userName: "elee", followerCount: 100, isVerified: true),
        
        UserModel(displayName: "Emily", userName: "itsemily1995", followerCount: 55, isVerified: false),
        
        UserModel(displayName: "Samantha", userName: "ninja", followerCount: 355, isVerified: false),
        
        UserModel(displayName: "Chris", userName: "chrish2009", followerCount: 88, isVerified: true),
    ]
    
    var body: some View {
        NavigationView {
            List { // START: List
                ForEach(users) { user in
                    HStack(spacing: 15) { // START: HS
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .font(.caption)
                        }
                    }// END: HS
                    .padding(.vertical, 10)
                }
            }// END: LIST
            .navigationTitle("Users")
        }
    }
}

struct CustomDatacamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatacamp()
    }
}
