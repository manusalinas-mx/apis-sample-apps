//
//  ContentView.swift
//  ChuckNorrisPhrases
//
//  Created by Manuel Salinas on 11/13/24.
//

import SwiftUI

struct ContentView: View {

    @State private var viewModel = PhrasesViewModel(service: PhrasesService(urlString: "https://api.chucknorris.io/jokes/random"))

    var body: some View {
        ZStack {
            Color.green.opacity(0.2)
                .ignoresSafeArea()

            VStack {
                if viewModel.isLoading {
                    ProgressView()

                } else if let error = viewModel.error {
                    Text(error.localizedDescription)
                        .font(.title)
                        .foregroundStyle(.red)

                } else if let phrase = viewModel.phrase {
                    PhraseView(phrase: phrase) {
                        Task {
                            await viewModel.loadPhrase()
                        }
                    }
                }
            }
            .padding()
            .task {
                await viewModel.loadPhrase()
            }
        }
    }
}

#Preview {
    ContentView()
}
