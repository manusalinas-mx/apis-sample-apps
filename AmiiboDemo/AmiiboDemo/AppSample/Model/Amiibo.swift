//
//  Amiibo.swift
//  AmiiboDemo
//
//  Created by Manuel Salinas on 11/19/24.
//

import Foundation

struct Amiibo: Decodable, Identifiable {
    let id: String
    let name: String
    let series: String
    let character: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id = "tail"
        case name
        case series = "gameSeries"
        case character
        case image
    }

    static var mock: Amiibo {
        .init(id: "1", name: "Amiibo", series: "Super Mario Bros.", character: "Mario", image: "https://m.media-amazon.com/images/I/71wTED+8DzL.jpg")
    }
}

