//
//  Phrase.swift
//  ChuckNorrisPhrases
//
//  Created by Manuel Salinas on 11/13/24.
//
import Foundation

struct Phrase: Decodable, Identifiable {
    let id: String
    let iconUrl: String
    let url: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case id
        case iconUrl = "icon_url"
        case url
        case value
    }

    static func mock() -> Phrase {
        Phrase(
            id: "e_MPx_R5QR28JRnbhdk94g",
            iconUrl: "https://api.chucknorris.io/img/avatar/chuck-norris.png",
            url: "",
            value: "Remember Child's Play? The doll now hangs from Chuck Norris' rearview mirror."
        )
    }
}
