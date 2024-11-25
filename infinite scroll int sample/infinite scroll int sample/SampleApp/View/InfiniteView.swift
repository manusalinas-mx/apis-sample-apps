//
//  InfiniteView.swift
//  infinite scroll int sample
//
//  Created by Manuel Salinas on 11/25/24.
//

import SwiftUI

struct InfiniteView: View {

    @State private var currentPage: Int = 1
    @State private var viewModel = InfiniteViewModel(service: InfiniteService())


    var body: some View {
        Text("Infinite Scroll").bold()

        Text("Page size: 20 items")
            .foregroundStyle(.gray)
            .font(.footnote)

        List(viewModel.numbers, id: \.self) { number in
            Text("\(number)")
                .font(.largeTitle)
                .fontDesign(.rounded)
                .onAppear {
                    if viewModel.shouldLoadMoreData(from: number) {
                        currentPage += 1
                        viewModel.loadNextPage(currentPage)
                    }
                }
        }
        .task {
            viewModel.loadNextPage(currentPage)
        }
    }
}

#Preview {
    InfiniteView()
}
