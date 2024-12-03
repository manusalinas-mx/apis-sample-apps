//
//  ContentView.swift
//
//  Created by Manuel Salinas on 11/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var typingTimer: Timer? = nil
    @State private var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Text(searchText.isEmpty ? "Type to search..." : viewModel.results.isEmpty ? "No results found" : "Type something else")
                    .font(.title3)
                    .foregroundColor(.gray)

                Spacer()
            }
            // Option 1
//            .navigationDestination(isPresented: $viewModel.shouldNavigate) {
//                SearchResultView(results: viewModel.results)
//            }
            // Option 2
            .sheet(isPresented: $viewModel.shouldNavigate) {
                SearchResultView(results: viewModel.results)
            }
            .searchable(text: $searchText)
            .onChange(of: searchText) { _, newValue in
                // Reset the timer when the user types
                typingTimer?.invalidate()
                typingTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                    // Update results after the delay
                    viewModel.searching(newValue)
                }
            }
            .navigationTitle("Search Items")
        }
    }
}

#Preview {
    ContentView()
}
