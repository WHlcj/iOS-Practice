//
//  Location.swift
//  SwiftfulMap
//
//  Created by Changjun Li on 2023/3/27.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {

    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        name + cityName
    }
    
    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {// lefthandside & righthandside
        lhs.id == rhs.id
    }
    
}

