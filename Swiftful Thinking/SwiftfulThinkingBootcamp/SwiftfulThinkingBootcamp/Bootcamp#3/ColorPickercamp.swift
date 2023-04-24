//
//  ColorPickercamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/26.
//

import SwiftUI

struct ColorPickercamp: View {
    
    @State var backgroundColor = Color.green
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            
            ColorPicker("Select a color",
                        selection: $backgroundColor,
                        supportsOpacity: true)
            .padding()
            .background(Color.black)
            .cornerRadius(15)
            .colorMultiply(.white)
            .foregroundColor(Color.white)
            .font(.headline)
            .padding(50)
        }
    }
}

struct InnerCircleView: View {
    var body: some View {
        Circle()
            .fill(Color.green)
            .frame(width: 40, height: 40, alignment: .center)
    }
}

struct ColorMultiply: View {
    var body: some View {
        HStack {
            Color.red.frame(width: 100, height: 100, alignment: .center)
                .overlay(InnerCircleView(), alignment: .center)
                .overlay(Text("Normal")
                             .font(.callout),
                         alignment: .bottom)
                .border(Color.gray)

            Spacer()

            Color.red.frame(width: 100, height: 100, alignment: .center)
                .overlay(InnerCircleView(), alignment: .center)
                .colorMultiply(Color.cyan)
                .overlay(Text("Multiply")
                            .font(.callout),
                         alignment: .bottom)
                .border(Color.gray)
        }
        .padding(50)
    }
}

struct ColorPickercamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickercamp()
        ColorMultiply()
    }
}
