//
//  HighSchoolList.swift
//  HighSchool-Photon
//
//  Created by Manuel Salinas on 11/12/24.
//

import SwiftUI

struct HighSchoolList: View {
    @State private var viewModel = HighSchoolViewModel(service: HighSchoolService(urlString: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"))
    @State private var showError: Bool = false

    var body: some View {
        NavigationStack {
            List(viewModel.highSchools) { highSchool in
                NavigationLink(destination: HighSchoolDetail(highSchool: highSchool)) {
                    HighSchoolRow(school: highSchool)
                }
                .foregroundStyle(.indigo)
            }
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
        }
    }
}

#Preview {
    HighSchoolList()
}
