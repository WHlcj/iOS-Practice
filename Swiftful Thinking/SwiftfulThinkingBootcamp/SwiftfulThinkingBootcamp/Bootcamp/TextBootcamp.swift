//
//  TextBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/18.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text("Hello World! This is the Swiftful Thinking Boorcamp. I am realy enjoying this course and learning alot".uppercased())//.capitalized
//            .font(.body)
//            //.fontWeight(.medium)
//            //.underline()
//            .underline(color: Color.red)
//            .italic()   //斜体
//            //.strikethrough()
//            .strikethrough(true, color: Color.red) //下划线
//            .font(.system(size: 40, weight: .heavy, design: .rounded))
           // .baselineOffset(20) //行距
            //.kerning(2)  //字距
            .multilineTextAlignment(.center)
            .foregroundColor(.blue)
            .frame(width: 200, height: 100, alignment: .center)
            .minimumScaleFactor(0.1)
        
    
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
