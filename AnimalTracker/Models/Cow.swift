//
//  Cow.swift
//  AnimalTracker
//
//  Created by Askar on 03.05.2022.
//

import Foundation

struct Cow {
    
    let id: Int
    let lat: String
    let lon: String
    
    static func generateCows() -> [Cow] {
        var list: [Cow] = []
        for i in 0..<9 {
            let id = i
            let lat = "43.20819\(i)8111"
            let lon = "76.66920\(i)8362"
            let cow = Cow(id: id, lat: lat, lon: lon)
            list.append(cow)
        }
        return list
    }
}
