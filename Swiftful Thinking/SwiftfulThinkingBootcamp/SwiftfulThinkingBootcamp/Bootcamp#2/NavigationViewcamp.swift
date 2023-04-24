//
//  NavigationView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/25.
//

import SwiftUI

struct NavigationViewcamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Hello Navigation")
                Text("Hello Navigation")
                Text("Hello Navigation")
            }
            .navigationTitle("All Inboxes")
            //.navigationBarTitleDisplayMode(.automatic)
            //.toolbar(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "person.fill")
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: MyOtherScreen(),
                        label: {
                            Image(systemName: "gear")
                        }
                    )
                    .tint(.cyan)
                }
            }
        }
    }
}

struct MyOtherScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
                .navigationTitle("Green Screen!")
                .toolbar(.hidden)
            
            VStack {
                Button("Back Button", action: {
                    dismiss()
                })
                NavigationLink("Click here", destination: Text("3rd screen"))
            }
        }
    }
}


struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewcamp()
    }
}
