//
//  AppErrors.swift
//  MediaPosts
//
//  Created by Manuel Salinas on 1/15/25.
//

import SwiftUI

enum AppError: LocalizedError {
    case unknown
    case post
    case comment
    case custom(String)

    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .post:
            return "Error fetching posts"
        case .comment:
            return "Error fetching comments"
        case .custom(let message):
            return message
        }
    }
}
