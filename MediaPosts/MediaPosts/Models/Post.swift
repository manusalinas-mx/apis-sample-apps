//
//  Post.swift
//  MediaPosts
//
//  Created by Manuel Salinas on 1/15/25.
//

import Foundation


struct Post: Codable, Identifiable {
    let id: Int?
    let userId: Int?
    let title: String?
    let body: String?
}

// MARK: - Mocking
extension Post {
    static var mock: [Post] {
        [
            Post(id: 1, userId: 1, title: "My first post", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"),
            Post(id: 2, userId: 1, title: "My second post", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"),
            Post(id: 3, userId: 1, title: "My third post", body: "dolore placeat quibusdam ea quo vitae\nmagni quis enim qui quis quo nemo aut saepe\nquidem repellat excepturi ut quia\nsunt ut sequi eos ea sed quas"),
            Post(id: 4, userId: 1, title: "My almost last post", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"),
            Post(id: 5, userId: 1, title: "My last post", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"),
        ]
    }
}


