//
//  ProfileViewModel.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//

import Foundation
import Observation

@Observable
class ProfileViewModel {
    var profile: Profile?
    var isLoading: Bool = false
    var error: Error?

    private let service: ProfileService

    init(service: ProfileService) {
        self.service = service
    }

    func loadProfile() async {
        error = nil
        isLoading = true

        do {
            profile = try await service.getProfile()
        } catch let err {
            self.error = err
        }

        isLoading = false
    }
}

