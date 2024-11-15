//
//  Profile.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//


struct Profile: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email, phone, cell: String
    let picture: Picture
}
