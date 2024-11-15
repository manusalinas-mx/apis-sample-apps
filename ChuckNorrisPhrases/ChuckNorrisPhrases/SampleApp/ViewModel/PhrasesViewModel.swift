//
//  PhrasesViewModel.swift
//  ChuckNorrisPhrases
//
//  Created by Manuel Salinas on 11/13/24.
//

import Foundation
import Observation

@Observable
class PhrasesViewModel{

    var phrase: Phrase?
    var isLoading: Bool = false
    var error: Error?

    // Dependency Injection
    private let service: PhrasesService

    init(service: PhrasesService) {
        self.service = service
    }

    func loadPhrase() async {
        isLoading = true

        do {
            phrase = try await service.getPhrase()
        } catch let err {
            error = err
        }
        isLoading = false
    }
}
