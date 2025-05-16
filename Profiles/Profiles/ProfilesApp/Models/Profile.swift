//
//  Profile.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//
import Foundation

struct Profile: Codable {
    let gender: String?
    let name: Name?
    let location: Location?
    let email, phone, cell: String?
    let picture: Picture?
    
    static func mock() -> Profile {
        Profile(
            gender: "male",
            name: Name.mock(),
            location: Location.mock(),
            email: "john.doe@example.com",
            phone: "+52 477 123 4567",
            cell: "+52 1 477 765 4321",
            picture: Picture.mock()
        )
    }
}
