//
//  ArtItemsView.swift
//  ApiTabs
//
//  Created by Manuel Salinas on 12/4/24.
//

import SwiftUI

struct ArtItemsView: View {
    let department: Department
    @Bindable var viewModel: ArtViewModel
    @Namespace private var namespace

    @State private var isLoaded = false

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading items...")
                } else {
                    List(viewModel.items) { item in
                        if let picUrl = item.imageUrl,
                           let url = URL(string: picUrl) {
                            NavigationLink {
                                ItemDetailView(picUrl: url)
                                    .navigationTransition(.zoom(sourceID: item.id, in: namespace))
                                    .toolbarVisibility(.hidden, for: .navigationBar)
                                    .toolbarVisibility(.hidden, for: .tabBar)
                            } label: {
                                ItemRowView(item: item)
                                    .matchedTransitionSource(id: item.id, in: namespace)
                            }
                        } else {
                            ItemRowView(item: item)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(department.name)
            .navigationBarTitleDisplayMode(.inline)
        }
        .refreshable {
            await viewModel.fecthObjects(by: department.id)
        }
        .task {
            if !isLoaded {
                await viewModel.fecthObjects(by: department.id)
                isLoaded = true
            }
        }
    }
}

#Preview {
    let vm = ArtViewModel(service: ArtService())
    ArtItemsView(department: Department.mock, viewModel: vm)
}
