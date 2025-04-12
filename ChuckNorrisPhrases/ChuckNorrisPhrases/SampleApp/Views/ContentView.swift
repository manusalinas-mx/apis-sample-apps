//
//  ContentView.swift
//  ChuckNorrisPhrases
//
//  Created by Manuel Salinas on 11/13/24.
//

import SwiftUI

struct ContentView: View {

    @State private var viewModel = PhrasesViewModel(service: PhrasesService(urlString: Apis.kchuckRandomUrl))

    var body: some View {
        ZStack {
            Color.green.opacity(0.2)
                .ignoresSafeArea()

            VStack {
                if viewModel.isLoading {
                    ProgressView()

                } else if let error = viewModel.error {
                    ContentUnavailableView {
                        Text(error.localizedDescription)
                            .font(.title)
                            .foregroundStyle(.red)
                    } actions: {
                        Button("Reload") {
                            Task {
                                await viewModel.loadPhrase()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                } else if let phrase = viewModel.phrase {
                    PhraseView(phrase: phrase) {
                        Task {
                            await viewModel.loadPhrase()
                        }
                    }
                }
            }
            .padding()
        }
        .task {
            await viewModel.loadPhrase()
        }
    }
}

#Preview {
    ContentView()
}
