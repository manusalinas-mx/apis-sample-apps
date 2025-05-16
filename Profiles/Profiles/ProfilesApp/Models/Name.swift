//
//  Name.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//


struct Name: Codable {
    let title, first, last: String?

    var fullname: String {
        "\(first ?? "") \(last ?? "")"
    }
    
    static func mock() -> Name {
        Name(
            title: "Mr.",
            first: "John",
            last: "Doe"
        )
    }
}
