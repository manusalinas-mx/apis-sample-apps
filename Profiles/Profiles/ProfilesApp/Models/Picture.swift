//
//  Picture.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//


struct Picture: Codable {
    let large, medium, thumbnail: String?
    
    static func mock() -> Picture {
        Picture(
            large: "https://randomuser.me/api/portraits/men/1.jpg",
            medium: "https://randomuser.me/api/portraits/med/men/1.jpg",
            thumbnail: "https://randomuser.me/api/portraits/thumb/men/1.jpg"
            
        )
    }
}
