//
//  Spacercamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/20.
//

import SwiftUI

struct Spacercamp: View {
    var body: some View {
//        HStack {
//
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//
//            Rectangle()
//                .fill(.green)
//                .frame(width: 50, height: 50)
//
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//
//            Rectangle()
//                .fill(.red)
//                .frame(width: 50, height: 50)
//
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//
//            Rectangle()
//                .frame(width: 50, height: 50)
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//        }
        //.background(.blue)
        
        VStack {
            HStack {
                Image(systemName: "xmark")
                Spacer()
                    .frame(height: 10)
                    .background(.orange)
                Image(systemName: "gear")
            }
            .font(.title)
            .background(.yellow)
            .padding(.horizontal)
            .background(.blue)
            
//            Spacer()
//                .frame(width: 10)
//                .background(.orange)
        }
        //.background(.yellow)
    }
}

struct Spacercamp_Previews: PreviewProvider {
    static var previews: some View {
        Spacercamp()
    }
}
