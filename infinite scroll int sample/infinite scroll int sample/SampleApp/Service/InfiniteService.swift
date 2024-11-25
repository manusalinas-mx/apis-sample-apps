//
//  InfiniteService.swift
//  infinite scroll int sample
//
//  Created by Manuel Salinas on 11/25/24.
//

import Foundation

class InfiniteService {
    private let urlString: String = "https://island-bramble.glitch.me/data"

    func fetchData(page: Int) async throws -> [Int] {

        var components =  URLComponents(string: urlString)
        components?.queryItems = [
            URLQueryItem(name: "page", value: page.description)
        ]

        guard let url = components?.url else {
            return []
        }

        let (data, _ ) = try await URLSession.shared.data(from: url)
        let numbers = try JSONDecoder().decode([Int].self, from: data)

        return numbers
    }
}
