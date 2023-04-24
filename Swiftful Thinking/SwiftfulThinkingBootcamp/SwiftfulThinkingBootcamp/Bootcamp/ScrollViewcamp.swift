//
//  StrollViewcamo.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/21.
//

import SwiftUI

struct StrollViewcamo: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(0..<10) { index in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(0..<10) { index in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.blue)
                                    .frame(width: 200,height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct StrollViewcamo_Previews: PreviewProvider {
    static var previews: some View {
        StrollViewcamo()
    }
}
