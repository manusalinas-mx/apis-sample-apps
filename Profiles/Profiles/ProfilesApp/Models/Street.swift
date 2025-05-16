//
//  Street.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//


struct Street: Codable {
    let number: Int?
    let name: String?
    
    static func mock() -> Street {
        Street(
            number: 123,
            name: "Main Street"
        )
    }
}
