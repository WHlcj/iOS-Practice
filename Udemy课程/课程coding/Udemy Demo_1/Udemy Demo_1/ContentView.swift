//
//  ContentView.swift
//  Udemy Demo_1
//
//  Created by Changjun Li on 2023/6/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.5, green: 0.5, blue: 1, opacity: 0.3)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Whlcj")
                    .font(.custom("AnnieUseYourTelescope-Regular", size: 40))
                //AnnieUseYourTelescope-Regular
                    //.font(Font.custom("Pacifico-Regular", size: 40))
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            //.previewLayout(.sizeThatFits)
    }
}
