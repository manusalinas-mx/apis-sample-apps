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
            PostRowView(post: post, totalComments: comments.count)
                .padding(.horizontal)

            List {
                Section("Comments") {
                    ForEach(comments) { comment in
                        CommentRowView(comment: comment)
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
