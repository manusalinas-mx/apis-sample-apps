//
//  PhrasesService.swift
//  ChuckNorrisPhrases
//
//  Created by Manuel Salinas on 11/13/24.
//

import Foundation

class PhrasesService {
    private let urlString: String

    init(urlString: String) {
        self.urlString = urlString
    }

    func getPhrase() async throws -> Phrase {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        // Intencional delay
        let delayInSeconds = UInt64(Int.random(in: 1...2))
        try await Task.sleep(nanoseconds: delayInSeconds * 1_000_000_000)

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Phrase.self, from: data)
    }
}
