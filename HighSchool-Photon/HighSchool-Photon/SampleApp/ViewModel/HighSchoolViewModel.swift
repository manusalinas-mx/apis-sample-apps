//
//  HighSchoolViewModel.swift
//  HighSchool-Photon
//
//  Created by Manuel Salinas on 11/12/24.
//

import Foundation
import Observation

@Observable
class HighSchoolViewModel {
    var highSchools: [HighSchool] = []
    var errorMessage: String?

    private let service: HighSchoolService

    init(service: HighSchoolService) {
        self.service = service
    }

    func loadHighSchools() async {
        do {
            highSchools = try await service.fetchHighSchools()
        } catch  {
            errorMessage = error.localizedDescription
        }
    }
}
