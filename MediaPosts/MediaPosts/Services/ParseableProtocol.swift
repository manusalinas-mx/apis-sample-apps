//
//  ParseableProtocol.swift
//  MediaPosts
//
//  Created by Manuel Salinas on 22/04/25.
//


import Foundation

protocol ParseableProtocol {
    func fetchData<T: Decodable>(from url: URL) async throws -> T
}

extension ParseableProtocol {
    func fetchData<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}
