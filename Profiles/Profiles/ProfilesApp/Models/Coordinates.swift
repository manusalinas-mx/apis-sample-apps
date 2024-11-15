//
//  Coordinates.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//


struct Coordinates: Codable {
    private let latitude, longitude: String

    var lat: Double { Double(latitude) ?? 0.0 }
    var long: Double { Double(longitude) ?? 0.0 }
}
