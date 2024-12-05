//
//  ArtObject.swift
//  ApiTabs
//
//  Created by Manuel Salinas on 12/4/24.
//

import Foundation

struct ArtObject: Codable, Identifiable {
    let id: Int
    let title: String
    let imageUrl: String?
    let culture: String?
    let period: String?

    enum CodingKeys: String, CodingKey {
        case id = "objectID" 
        case title
        case imageUrl = "primaryImage"
        case culture
        case period
    }

    static var mock: ArtObject {
        ArtObject(id: 45734, title: "Quail and Millet", imageUrl: "https://images.metmuseum.org/CRDImages/as/original/DP251139.jpg", culture: "Japan", period: "Edo period (1615–1868)")
    }
}
