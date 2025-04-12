//
//  PhraseView.swift
//  ChuckNorrisPhrases
//
//  Created by Manuel Salinas on 11/13/24.
//

import SwiftUI

struct PhraseView: View {

    let phrase: Phrase
    let action: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            if let iconUrl = phrase.iconUrl,
               let url = URL(string: iconUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView {
                        Text("Loading...")
                    }
                }
                .frame(width: 150, height: 150)
            }

            Text(phrase.value ?? ". . .")
                .font(.title)
                .fontDesign(.rounded)


            Button("Get Another") {
                action()
            }
            .buttonStyle(.bordered)
            .font(.title2)
            .tint(.blue)

            Spacer()
        }
    }
}
