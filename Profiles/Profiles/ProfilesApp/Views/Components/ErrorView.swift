//
//  ErrorView.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    @Environment(ProfileViewModel.self) private var viewModel

    var body: some View {
        VStack {
            ContentUnavailableView {
                // 1
                Label("Api Error", systemImage: "xmark.icloud.fill")
                    .symbolEffect(.variableColor)
                    .foregroundStyle(.red)

            } description: {
                // 2
                Text(error.localizedDescription)
            } actions: {
                // 3
                Button {
                    Task {
                        await viewModel.loadProfile()
                    }
                } label: {
                    Label("Retry", systemImage: "arrow.circlepath")
                }
                .buttonStyle(.bordered)
                .tint(.blue)
            }
            .padding()
        }
    }
}

#Preview {
    ErrorView(error: MockError.sample)
        .environment(ProfileViewModel.preview)
}
