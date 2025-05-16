//
//  HighSchoolList.swift
//  HighSchool-Photon
//
//  Created by Manuel Salinas on 11/12/24.
//

import SwiftUI

struct HighSchoolList: View {
    @State private var viewModel = HighSchoolViewModel(service: HighSchoolService(urlString: Apis.kHighSchoolUrl))
    @State private var showError: Bool = false

    // Searchable
    @State private var searchText: String = ""
    @State private var searchDelayTimer: Timer?

    var body: some View {
        NavigationStack {

            VStack {
                if viewModel.isLoading {
                    ProgressView {
                        Text("Loading...")
                    }
                } else {

                    if viewModel.highSchools.isEmpty {
                        ContentUnavailableView.search(text: searchText)
                    }

                    List(viewModel.highSchools) { highSchool in
                        NavigationLink(destination: HighSchoolDetail(highSchool: highSchool)) {
                            HighSchoolRow(school: highSchool)
//                                .onAppear {
//                                    if viewModel.highSchools.isLastItem(highSchool) {
//                                        //let _ =  print("ultimo item: \(highSchool.name)")
//                                    }
//                                }
                        }
                        .foregroundStyle(.indigo)
                    }
                }
            } // - VStack
            .listStyle(.plain)
            .navigationBarTitle("NY High Schools")
            .toolbarBackground(.indigo.opacity(0.2), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .task {
                await viewModel.loadHighSchools()
                showError = ((viewModel.errorMessage?.isEmpty) != nil)
            }
            .refreshable {
                await viewModel.loadHighSchools()
            }
            .alert(isPresented: $showError) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? "Unknown Error"),
                    dismissButton: .cancel()
                )
            }
            .searchable(text: $searchText, prompt: "Search High Schools")
            .onChange(of: searchText) { _ , newValue in
                searchDelayTimer?.invalidate()
                searchDelayTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                    Task { await viewModel.searchHighSchool(newValue) }
                }
            }
        }
    }
}

#Preview {
    HighSchoolList()
}
