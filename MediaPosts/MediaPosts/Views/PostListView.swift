//
//  PostListView.swift
//  MediaPosts
//
//  Created by Manuel Salinas on 1/15/25.
//

import SwiftUI

struct PostListView: View {

    @State private var viewModel = PostsViewModel(service: PostService(baseUrl: Constants.kBaseUrl))

    var body: some View {
        NavigationStack {
            // MARK: - LIST
            List(viewModel.posts) { post in
                // MARK: - POST ROW
                let comments = viewModel.filterCommentsByPostId(post.id)
                NavigationLink {
                    // MARK: - POST DETAIL
                    PostDetailView(post: post, comments: comments)

                } label: {
                    PostRowView(post: post, totalComments: comments.count)
                }
            }
            .navigationTitle("Timeline")
            .listStyle(.plain)
            .refreshable {
                await viewModel.loadPosts()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if viewModel.posts.isEmpty {
                    ContentUnavailableView("No Posts Found", systemImage: "rectangle.dashed", description: Text("Pull to refresh or try again later"))
                }
            }
        }
        .alert(isPresented: $viewModel.showErroralert) {
            Alert(title: Text("Error"), message: Text(viewModel.serviceError?.message ?? AppError.unknown.message), dismissButton: .cancel())
        }
        .task {
            await viewModel.loadPosts()
        }
    }
}

#Preview {
    PostListView()
}
