//
//  SearchViewModel.swift
//
//  Created by Manuel Salinas on 11/19/24.
//

import Foundation
import Observation

@Observable
class SearchViewModel {

    var results: [String] = []
    var shouldNavigate: Bool = false

    func searching(_ text: String) {
        guard !text.isEmpty else { return }
        
        let items = ["telephone", "telescope", "television", "ball", "basket ball", "volley ball", "Hugo Boss", "Apple", "Google", "Futbol"]
        results = items.filter { $0.localizedCaseInsensitiveContains(text) }

        if !results.isEmpty {
            shouldNavigate = true
        }
    }
}
