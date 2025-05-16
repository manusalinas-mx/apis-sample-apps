//
//  HeaderProfileView.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//
import SwiftUI

struct HeaderProfileView: View {
    let profile: Profile
    @Environment(ProfileViewModel.self) var viewModel

    var body: some View {
        ZStack {
            MapView(location: profile.location ?? .mock())
                .overlay {
                    Rectangle()
                        .ignoresSafeArea()
                        .opacity(0.3)
                        .blur(radius: 2)
                }

            ProfilePictureView(picture: profile.picture ?? Picture.mock())
                .onTapGesture {
                    Task {
                        await viewModel.loadProfile()
                    }
                }
        }
    }
}

#Preview {
    HeaderProfileView(profile: .mock())
        .environment(ProfileViewModel.preview)
}
