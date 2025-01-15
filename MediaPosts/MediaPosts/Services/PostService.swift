//
//  PostService.swift
//  MediaPosts
//
//  Created by Manuel Salinas on 1/15/25.
//

import Foundation

// MARK: - Protocol
protocol PostServiceProtocol {
    var baseUrl: String { get set }
    func fetchPosts() async throws -> [Post]
    func fetchComments() async throws -> [PostComment]
}

// MARK: - Implementation
class PostService: PostServiceProtocol {
    var baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    // MARK: Private methods
    private func fetchData<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }

    // MARK: Fetching
    func fetchPosts() async throws -> [Post] {
        guard let baseUrl = URL(string: baseUrl + Constants.kUrlPosts) else {
            throw URLError(.badURL)
        }

        let posts: [Post] = try await fetchData(from: baseUrl)
        return posts
    }

    func fetchComments() async throws -> [PostComment] {
        guard let baseUrl = URL(string: baseUrl + Constants.kUrlComments) else {
            throw URLError(.badURL)
        }

        let comments: [PostComment] = try await fetchData(from: baseUrl)
        return comments
    }
}
