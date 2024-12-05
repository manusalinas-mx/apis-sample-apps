//
//  Department.swift
//  ApiTabs
//
//  Created by Manuel Salinas on 12/4/24.
//

import Foundation

struct DepartmentResponse: Codable {
    let departments: [Department]
}

struct DepartmentObjects: Codable {
    let total: Int
    let objectIDs: [Int]
}

struct Department: Codable, Identifiable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "departmentId"
        case name = "displayName"
    }

    static var mock: Department {
        Department(id: 1, name: "Chinese Art")
    }
}
