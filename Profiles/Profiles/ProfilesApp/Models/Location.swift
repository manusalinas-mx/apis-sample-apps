//
//  Location.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//


struct Location: Codable {
    let street: Street
    let city, state, country: String
    let postcode: String? // can be Int or String
    let coordinates: Coordinates

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        street = try container.decode(Street.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        country = try container.decode(String.self, forKey: .country)
        coordinates = try container.decode(Coordinates.self, forKey: .coordinates)

        // Decodificar postcode como Int o String
        if let postcodeInt = try? container.decode(Int.self, forKey: .postcode) {
            postcode = postcodeInt.description
        } else if let postcodeString = try? container.decode(String.self, forKey: .postcode) {
            postcode = postcodeString
        } else {
            postcode = nil
        }
    }
}
