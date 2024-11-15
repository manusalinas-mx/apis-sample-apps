//
//  Name.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//


struct Name: Codable {
    let title, first, last: String

    var fullname: String {
        "\(first) \(last)"
    }
}
