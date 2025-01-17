//
//  PostDetailView.swift
//  MediaPosts
//
//  Created by Manuel Salinas on 1/15/25.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    let comments: [PostComment]

    var body: some View {
        VStack {
            // MARK: - HEADER POST
            PostRowView(post: post, totalComments: comments.count)
                .padding(.horizontal)

            Divider()

            // MARK: - COMMENT LIST
            List {
                Section("Comments") {
                    ForEach(comments) { comment in
                        CommentRowView(comment: comment)
                            .listRowSeparator(.hidden)
                            .buttonStyle(.plain)
                    }
                }
            }
            .listStyle(.plain)
            .overlay {
                if comments.isEmpty {
                    ContentUnavailableView("No Comments", systemImage: "ellipsis.message")
                }
            }
        }
    }
}

#Preview("Mockup") {
    PostDetailView(post: Post.mock[0], comments: PostComment.mock)
}

#Preview("Empty") {
    PostDetailView(post: Post.mock[0], comments: [])
}
