//
//  PostRowView.swift
//  MediaPosts
//
//  Created by Manuel Salinas on 1/15/25.
//

import SwiftUI

struct PostRowView: View {

    let post: Post
    let totalComments: Int

    var body: some View {
        HStack {
            ZStack {
                Capsule(style: .continuous)
                    .fill(.accent)

                Text(post.id.description)
                    .font(.caption2).fontDesign(.rounded).fontWeight(.bold)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: 30)
            .frame(height: 25)
            
            Spacer()
                .frame(width: 15)
            
            
            VStack(alignment: .leading) {
                Text(post.title.capitalized)
                    .font(.body).fontWeight(.bold)
                
                Text(post.body)
                    .font(.system(size: 12))

                HStack(spacing: 2) {
                    Spacer()

                    Image(systemName: "ellipsis.message.fill")
                        .font(.footnote)

                    Text("\(totalComments) comment\(totalComments == 1 ? "" : "s")")
                        .font(.caption).fontWeight(.medium)
                }
                .foregroundStyle(.gray)

            }
            .fontDesign(.rounded)
        }
    }
}

#Preview("Single Comment") {
    PostRowView(post: Post.mock[0], totalComments: 1)
        .padding()
}

#Preview("Many Comments") {
    PostRowView(post: Post.mock[0], totalComments: PostComment.mock.count)
        .padding()
}
