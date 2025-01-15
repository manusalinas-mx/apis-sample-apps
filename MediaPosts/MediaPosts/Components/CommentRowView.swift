//
//  CommentRowView.swift
//  MediaPosts
//
//  Created by Manuel Salinas on 1/15/25.
//

import SwiftUI

struct CommentRowView: View {
    let comment: PostComment

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(systemName: "quote.opening")
                .foregroundStyle(.gray.opacity(0.5))

            Text(comment.body)
                .font(.system(size: 12))

            HStack {
                Spacer()

                VStack(alignment: .trailing) {
                    Text(comment.name)
                        .font(.footnote).fontWeight(.bold)

                    // Valid Mail link
                    if let urlMail = URL(string: "mailto:" + comment.email) {
                        Link(comment.email, destination: urlMail)
                            .font(.caption)
                            .foregroundStyle(.accent)
                    }

                    Image(systemName: "quote.closing")
                        .foregroundStyle(.gray.opacity(0.5))
                        .padding(.vertical, 5)
                }
            }
        }
        .fontDesign(.rounded)
    }
}

#Preview {
    CommentRowView(comment: PostComment.mock[0])
        .padding()
}
