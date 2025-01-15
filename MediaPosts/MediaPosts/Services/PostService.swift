//
//  PostService.swift
//  MediaPosts
//
//  Created by Manuel Salinas on 1/15/25.
//

import Foundation

// MARK: - Protocol
protocol PostServiceProtocol {
    func fetchPosts() async throws -> [Post]
    func fetchComments() async throws -> [PostComment]
}

// MARK: - Implementation
class PostService: PostServiceProtocol {
    // MARK: Private methods
    private func fetchData<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }

    // MARK: Fetching
    func fetchPosts() async throws -> [Post] {
        guard let baseUrl = URL(string: Constants.kUrlPosts) else {
            throw URLError(.badURL)
        }

        let posts: [Post] = try await fetchData(from: baseUrl)
        return posts
    }

    func fetchComments() async throws -> [PostComment] {
        guard let baseUrl = URL(string: Constants.kUrlComments) else {
            throw URLError(.badURL)
        }

        let comments: [PostComment] = try await fetchData(from: baseUrl)
        return comments
    }
}
