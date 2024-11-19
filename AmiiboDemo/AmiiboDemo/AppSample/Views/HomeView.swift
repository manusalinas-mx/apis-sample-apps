//
//  HomeView.swift
//  AmiiboDemo
//
//  Created by Manuel Salinas on 11/19/24.
//

import SwiftUI

struct HomeView: View {

    @State private var viewModel = AmiiboViewModel(service: AmiiboService())
    @State private var searchText: String = ""
    @State private var typingtimer: Timer?

    var body: some View {
        NavigationStack {
            ZStack {
                Color.cyan.opacity(0.2)
                    .ignoresSafeArea()

                VStack {
                    if viewModel.isLoading {
                        ProgressView {
                            Text("Loading...")
                        }

                    } else if let error = viewModel.error {
                        Text("Error: \(error.localizedDescription)")

                    } else if viewModel.amiibos.isEmpty && !searchText.isEmpty {
                        Text("No Amiibo Found for **'\(searchText)'**")

                    } else {
                        AmiiboGridView(amiibos: viewModel.amiibos)
                    }
                }
            }
            .navigationTitle("Amiibo Stock")
        }
        .searchable(text: $searchText, prompt: Text("Search Amiibo"))
        .onChange(of: searchText) { (_, newValue) in
            typingtimer?.invalidate()
            typingtimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                Task {
                    await viewModel.fecthAmiibos(term: newValue)
                }
            }
        }
        .task {
            await viewModel.fecthAmiibos(term: "")
        }
    }
}

#Preview {
    HomeView()
}
