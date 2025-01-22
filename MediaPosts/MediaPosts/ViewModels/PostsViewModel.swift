//
//  PostsViewModel.swift
//  MediaPosts
//
//  Created by Manuel Salinas on 1/15/25.
//
import Foundation

@MainActor
class PostsViewModel: ObservableObject {
    private let service: PostServiceProtocol
    private var comments: [PostComment] = []

    @Published var posts: [Post] = []
    @Published var isLoading: Bool = false
    @Published var serviceError: AppError?
    @Published var showErroralert: Bool = false

    // MARK: initialization
    init(service: PostServiceProtocol) {
        self.service = service
    }

    // MARK: fetching
    func loadPosts() async {
        isLoading = true
        showErroralert = false
        serviceError = nil

        do {
            // Getting posts...
            posts = try await service.fetchPosts().sorted(by: { $0.id < $1.id })

            // Getting comments...
            do {
                comments = try await service.fetchComments().sorted(by: { $0.id < $1.id })
            } catch {
                serviceError = AppError.commentError
                showErroralert = true
            }

        } catch {
            serviceError = AppError.postError
            showErroralert = true
        }

        isLoading = false
    }

    // MARK: Filtering
    func filterCommentsByPostId(_ postId: Int) -> [PostComment] {
        comments.filter({ $0.postId == postId })
    }
}
