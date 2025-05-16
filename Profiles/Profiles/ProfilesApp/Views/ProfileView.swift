//
//  ProfileView.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//

import SwiftUI
import MapKit

struct ProfileView: View {
    @State private var viewModel = ProfileViewModel(
        service: ProfileService(urlString: "https://randomuser.me/api/")
    )

    @State private var animatedContent = false

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()

            } else if let error = viewModel.error {

                ErrorView(error: error)
                    .environment(viewModel)

            } else if let profile = viewModel.profile {
                VStack {
                    HeaderProfileView(profile: profile)
                        .environment(viewModel)

                    FullNameView(profile: profile)
                    
                    AdressView(profile: profile)
                    
                    Spacer()
                    Divider()
                    
                    ContactView(profile: profile)
                }
                .background(Color.indigo.opacity(0.05))
            }
        }
        .task {
            await viewModel.loadProfile()
        }
    }
}

#Preview {
    ProfileView()
}
