//
//  PostComment.swift
//  MediaPosts
//
//  Created by Manuel Salinas on 1/15/25.
//

import Foundation

struct PostComment: Codable, Identifiable {
    let id: Int?
    let postId: Int?
    let name: String?
    let email: String?
    let body: String?
}

// MARK: - Mocking
extension PostComment {
    static var mock: [PostComment] {
        [
            PostComment(id: 1, postId: 1, name: "Randolf the Rune-carver", email: "Hayden@althea.biz", body: "Legends speak of Randolf, whose Rune-carver nature led to the discovery of forgotten lands far across the sea."),
            PostComment(id: 2, postId: 1, name: "Meya the Dream-seer", email: "Payden@althea.ur", body: "In the grand halls of yore, tales abound of Meya, known for her Dream-seer heart and unbreakable will."),
            PostComment(id: 3, postId: 1, name: "Brynja the Hearth-bound", email: "lyozw@tohru.org", body: "By the old gods, Brynja the Hearth-bound was chosen, embarking on a quest to retrieve Odin's lost eye."),
            PostComment(id: 4, postId: 1, name: "Geiravor the Mist-rider", email: "Zayden@althea.com", body: "Legends tell of Bodil the Bone-singer, whose voice could calm the fiercest seas."),
        ]
    }
}
