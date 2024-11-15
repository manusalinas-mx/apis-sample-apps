//
//  ProfileService.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//

import Foundation

class ProfileService {
    private let urlString: String

    init(urlString: String) {
        self.urlString = urlString
    }

    func getProfile() async throws -> Profile? {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ServiceResponse.self, from: data)
        return response.results.first
    }
}
