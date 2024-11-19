//
//  SearchResultView.swift
//
//  Created by Manuel Salinas on 11/19/24.
//

import SwiftUI

struct SearchResultView: View {
    let results: [String]

    var body: some View {
        VStack {
            List(results, id: \.self) { result in
                Text(result)
            }
        }
        .navigationTitle("Results")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SearchResultView(results: ["One", "Two", "Three"])
}
