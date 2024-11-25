//
//  InfiniteViewModel.swift
//  infinite scroll int sample
//
//  Created by Manuel Salinas on 11/25/24.
//

import Foundation
import Observation

@Observable
class InfiniteViewModel {

    var numbers: [Int] = []
    private var service: InfiniteService

    init(service: InfiniteService) {
        self.service = service
    }

    func shouldLoadMoreData(from page: Int) -> Bool {
        page == numbers.count - 2
    }

    func loadNextPage(_ page: Int) {
        Task {
            let nums = try! await service.fetchData(page: page)
            numbers.append(contentsOf: nums)
        }
    }
}

