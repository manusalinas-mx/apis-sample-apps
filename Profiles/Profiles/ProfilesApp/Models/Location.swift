//
//  Location.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//


struct Location: Codable {
    let street: Street?
    let city, state, country: String?
    let postcode: String? // can be Int or String
    let coordinates: Coordinates?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        street = try container.decodeIfPresent(Street.self, forKey: .street)
        city = try container.decodeIfPresent(String.self, forKey: .city)
        state = try container.decodeIfPresent(String.self, forKey: .state)
        country = try container.decodeIfPresent(String.self, forKey: .country)
        coordinates = try container.decodeIfPresent(Coordinates.self, forKey: .coordinates)

        // Decodificar postcode como Int o String
        if let postcodeInt = try? container.decode(Int.self, forKey: .postcode) {
            postcode = postcodeInt.description
        } else if let postcodeString = try? container.decode(String.self, forKey: .postcode) {
            postcode = postcodeString
        } else {
            postcode = nil
        }
    }
    
    // Manual initializer (para mocks o código manual)
    init(
        street: Street?,
        city: String?,
        state: String?,
        country: String?,
        postcode: String?,
        coordinates: Coordinates?
    ) {
        self.street = street
        self.city = city
        self.state = state
        self.country = country
        self.postcode = postcode
        self.coordinates = coordinates
    }
    
    static func mock() -> Location {
        Location(
            street: Street.mock(),
            city: "León",
            state: "Guanajuato",
            country: "México",
            postcode: "37000",
            coordinates: Coordinates.mock()
        )
    }
}
