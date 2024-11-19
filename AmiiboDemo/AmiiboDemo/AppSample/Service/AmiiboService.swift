//
//  AmiiboService.swift
//  AmiiboDemo
//
//  Created by Manuel Salinas on 11/19/24.
//

import Foundation

class AmiiboService {
    let strUrl: String = "https://www.amiiboapi.com/api/amiibo/"

    func searchAmiibos(with query: String) async throws -> [Amiibo] {
        var components = URLComponents(string: strUrl)
        components?.queryItems = [URLQueryItem(name: "name", value: query)]

        guard let url = components?.url else {
            throw URLError(.badURL)
        }

        let (data, _ ) = try await URLSession.shared.data(from: url)
        let amiibos = try JSONDecoder().decode(AmiiboResponse.self, from: data).amiibo
        return amiibos
    }
}
