//
//  Gridcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/21.
//

import SwiftUI

struct Gridcamp: View {
    
    let columns: [GridItem] = [
//        GridItem(.adaptive(minimum: 10, maximum: 300), spacing: nil, alignment: nil),
//        GridItem(.adaptive(minimum: 150, maximum: 300), spacing: nil, alignment: nil),
        
        GridItem(.flexible(), spacing: 8, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.fixed(50), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        ScrollView {
            
//            Rectangle()
//                .fill(.white)
//                .frame(height: 400)
            
            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 8,//default 8
                pinnedViews: [.sectionHeaders]) {
                    
                    Section(
                        header: Text("Section 1")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.blue)
                            .padding()
                    ) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .frame(height: 150)
                        }
                    }
                    
                    Section(
                        header: Text("Section 2")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.orange)
                            .padding()
                    ) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(.green)
                                .frame(height: 150)
                        }
                    }
                    
                    
            }
            
//            LazyVGrid(columns: columns) {
//                ForEach(0..<20) { index in
//                    Rectangle()
//                        .frame(height: 150)
//                }
//            }
        }
    }
}

struct Gridcamp_Previews: PreviewProvider {
    static var previews: some View {
        Gridcamp()
    }
}
