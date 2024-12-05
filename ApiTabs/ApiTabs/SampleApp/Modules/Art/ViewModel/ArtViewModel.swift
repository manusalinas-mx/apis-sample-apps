//
//  ArtViewModel.swift
//  ApiTabs
//
//  Created by Manuel Salinas on 12/4/24.
//

import Foundation
import Observation

@MainActor
@Observable
class ArtViewModel {

    var departments: [Department] = []
    var items: [ArtObject] = []
    var isLoading: Bool = false

    private let service: ArtService

    init(service: ArtService) {
        self.service = service
    }

    func fecthDepartments() async {
        isLoading = true
        do {
            departments = try await service.getDepartments()
        } catch {
            print("Error fetching departments: \(error.localizedDescription)")
        }

        isLoading = false
    }

    func fecthObjects(by departmentId: Int) async {
        isLoading = true
        do {
            items = try await service.getObjects(from: departmentId)
        } catch {
            print("Error fetching objects: \(error.localizedDescription)")
        }

        isLoading = false
    }
}

