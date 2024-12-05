//
//  MuseumDepartmentsView.swift
//  ApiTabs
//
//  Created by Manuel Salinas on 12/4/24.
//

import SwiftUI

struct MuseumDepartmentsView: View {
    @State private var viewModel = ArtViewModel(service: ArtService())

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else {
                    List(viewModel.departments) { department in
                        NavigationLink {
                            ArtItemsView(department: department, viewModel: viewModel)
                        } label: {
                            Text(department.name)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .navigationTitle("Art Departments")
        }
        .task {
            if viewModel.departments.isEmpty {
                await viewModel.fecthDepartments()
            }
        }
        .refreshable {
            await viewModel.fecthDepartments()
        }
    }
}

#Preview {
    MuseumDepartmentsView()
}
