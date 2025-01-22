//
//  AppErrors.swift
//  MediaPosts
//
//  Created by Manuel Salinas on 1/15/25.
//

import SwiftUI

enum AppError: Error {
    case unknown
    case postError
    case commentError

    var message: LocalizedStringKey {
        switch self {
        case .unknown:
            return "Unknown error"
        case .postError:
            return "Error fetching posts"
        case .commentError:
            return "Error fetching comments"
        }
    }
}
