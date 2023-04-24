//
//  OnboardingView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/3/3.
//

import SwiftUI

// MARK: MainScreen
struct OnboardingView: View {
    
    //Onboarding states:
    /*
     0 - Welcome screen
     1 - Add name
     2 - Add age
     3 - Add gender
     */
    
    //MARK: AddGenderInit
    init() {
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.purple)
        
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.white
        ]
        
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
   
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    // Onboarding inputs
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    // For the alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // For app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIN: Bool = false
    
    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.green)
                }
            }
            
            //buttons
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
        .alert(
            isPresented: $showAlert,
            content: {
                return Alert(title: Text(alertTitle))
        })
    }
}

// MARK: COMPONENTS
extension OnboardingView {
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "Sign Up" : onboardingState == 3 ? "Finish" : "Next")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(10)
            .animation(nil)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay (
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(.white),
                    
                    alignment: .bottomTrailing
                )
            Text("This is the #1 app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI techniques.")
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    

    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            TextField("Your name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            Text(String(format: "%.0f", age))
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Slider(
                value: $age,
                in: 18...100,
                step: 1)
            .tint(.white)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    

    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)


            Picker("Select a gender", selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non-Binary").tag("Non-Binary")
            }
            .background(Color.white)
            .cornerRadius(8)
            .pickerStyle(.segmented)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
}

// MARK: FUNCTIONS
extension OnboardingView {
    
    func handleNextButtonPressed() {
        
        // Check Input
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "Your name must be at least 3 characters long!")
                return
            }
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please select a gender before moving forward!")
                return
            }
        default:
            break
        }
        
        // Go to next section
        if onboardingState == 3 {
            // sign in
            signIn()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIN = true
        }
        currentUserSignedIN = true
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .background(Color.purple)
            .ignoresSafeArea(.all)
    }
}
