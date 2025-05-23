//
//  HighSchool.swift
//  HighSchool-Photon
//
//  Created by Manuel Salinas on 11/12/24.
//

import Foundation

struct HighSchool: Codable, Identifiable {
    let id: String?
    let name: String?
    let overview: String?
    let totalStudents: String?

    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case name = "school_name"
        case overview = "overview_paragraph"
        case totalStudents = "total_students"
    }

    static func mock() -> HighSchool {
        HighSchool(id: "12345", name: "Mock High School", overview: "Ipsum latsum long text", totalStudents: "235")
    }
}
