//
//  HighSchoolService.swift
//  HighSchool-Photon
//
//  Created by Manuel Salinas on 11/12/24.
//

import Foundation

class HighSchoolService {
    private let urlString: String

    init(urlString: String) {
        self.urlString = urlString
    }

    func fetchHighSchools() async throws -> [HighSchool] {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let highSchools = try JSONDecoder().decode([HighSchool].self, from: data)
        return highSchools
    }
}
