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
    var isLoading: Bool = false

    private let service: HighSchoolService

    init(service: HighSchoolService) {
        self.service = service
    }

    func loadHighSchools() async {
        isLoading = true

        do {
            highSchools = try await service.fetchHighSchools().sorted(by: { $0.name < $1.name })
        } catch  {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    func searchHighSchool(_ term: String) async {
        isLoading = true

        guard !term.isEmpty && !highSchools.isEmpty else {
            await loadHighSchools()
            isLoading = false

            return
        }

        await loadHighSchools()
        
        let results = highSchools
        highSchools = results.filter({ $0.name.localizedCaseInsensitiveContains(term)})
        isLoading = false
    }
}
