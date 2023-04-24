//
//  IntroView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/3/3.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            // background
            RadialGradient(
                gradient: Gradient(colors: [.purple, .cyan]),
                center: .topLeading,
                startRadius: 10,
                endRadius: UIScreen.main.bounds.height)
                .ignoresSafeArea()
            
            if currentUserSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            } else {
                OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
            //if user is signed in
            //profile view
            //else
            //onboarding view
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
