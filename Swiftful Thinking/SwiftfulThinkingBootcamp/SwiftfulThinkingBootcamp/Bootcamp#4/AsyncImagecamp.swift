//
//  AsyncImagecamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/3/4.
//

import SwiftUI

/*
 case empty -> No image is loaded.
 case success(Image) -> An image succesfully loaded.
 case failure(Error) -> An image failed to load with an error.
 */
struct AsyncImagecamp: View {
    
    let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let returnedImage):
                returnedImage
                  .resizable()
                  .scaledToFit()
                  .frame(width: 100, height: 100)
                  .cornerRadius(20)
            case .failure:
                Image(systemName: "questionmark")
                    .font(.headline)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
//        AsyncImage(url: url, content: { returnedImage in
//            returnedImage
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .cornerRadius(20)
//        }, placeholder: {
//            ProgressView()
//        })
    }
}

struct AsyncImagecamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImagecamp()
    }
}
