//
//  MockError.swift
//  Profiles
//
//  Created by Manuel Salinas on 16/04/25.
//

import Foundation

enum MockError: Error, LocalizedError {
    case sample

    var errorDescription: String? {
        switch self {
        case .sample:
            return "Something went wrong. Please try again."
        }
    }
}
