//
//  LocatioResponse.swift
//  AnimalTracker
//
//  Created by Askar on 03.05.2022.
//

import Foundation

struct LocationResponse: Codable {
    let feeds: [Feed]
}

struct Feed: Codable {
    let created_at: String
    let entry_id: Int
    let field1: String
    let field2: String
}
