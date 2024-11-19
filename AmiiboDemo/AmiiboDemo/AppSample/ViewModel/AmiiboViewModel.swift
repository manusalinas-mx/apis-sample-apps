//
//  AmiiboViewModel.swift
//  AmiiboDemo
//
//  Created by Manuel Salinas on 11/19/24.
//

import Foundation
import Observation

@Observable
class AmiiboViewModel {

    var amiibos: [Amiibo] = []
    var error: Error?
    var isLoading: Bool = false


    private var service: AmiiboService

    init(service: AmiiboService) {
        self.service = service
    }

    func fecthAmiibos(term: String) async {
        isLoading = true
        amiibos.removeAll()
        
        do {
            self.amiibos = try await service.searchAmiibos(with: term)
        } catch {
            self.error = error
        }

        isLoading = false
    }
}
