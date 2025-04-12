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
        ZStack {
            // MARK: - BACKGROUND CARD
            Color.gray.opacity(0.1)
                .cornerRadius(10)

            // MARK: - INFO
            VStack(alignment: .leading, spacing: 5) {
                Image(systemName: "quote.opening")
                    .foregroundStyle(.gray.opacity(0.5))
                
                Text(comment.body ?? ". . .")
                    .font(.system(size: 14))
                
                HStack {
                    Spacer()

                    // MARK: - NAME AND EMAIL
                    VStack(alignment: .trailing) {
                        Text(comment.name ?? "Anonymous")
                            .font(.footnote).fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                        
                        // Valid Mail link
                        if let mail = comment.email,
                           let urlMail = URL(string: "mailto:" + mail) {
                            Link(mail, destination: urlMail)
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
            .padding(.horizontal, 18)
        }
    }
}

#Preview {
    CommentRowView(comment: PostComment.mock[0])
        .padding()
}
