//
//  EnvironmentObjectcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/3/2.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }
}

// MARK: MainScreen
struct EnvironmentObjectcamp: View {
    
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink {
                        DetailView(selectedItem: item)
                    } label: {
                        Text(item)
                    }
                }
            }
            .navigationTitle("IOS Devices")
        }
        .environmentObject(viewModel)
    }
}

// MARK: SubView
struct FinalView: View {
    
    @EnvironmentObject var viewModel2: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            //background
            LinearGradient(
                gradient: Gradient(colors: [.cyan, .blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            //foreground
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel2.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
    }
}

struct DetailView: View {
    
    let selectedItem: String
    
    var body: some View {
        ZStack {
            //background
            Color.orange
                .ignoresSafeArea()
            
            //foreground
            NavigationLink(
                destination: FinalView(),
                label: {
                    Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(30)
                })
        }
    }
}

struct EnvironmentObjectcamp_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectcamp()
        //FinalView()
    }
}
