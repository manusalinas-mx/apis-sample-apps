//
//  PostService.swift
//  MediaPosts
//
//  Created by Manuel Salinas on 1/15/25.
//

import Foundation

// MARK: - Protocol
protocol PostServiceProtocol: Sendable {
    var baseUrl: String { get set }
    func fetchPosts() async throws -> [Post]
    func fetchComments() async throws -> [PostComment]
}

// MARK: - Implementation
class PostService: PostServiceProtocol, ParseableProtocol,  @unchecked Sendable {
    var baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
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
