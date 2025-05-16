//
//  ProfilePictureView.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//

import SwiftUI

struct ProfilePictureView: View {
    let picture: Picture

    @State private var isAnimated = false
    private let placeholderUrl = "https://www.shutterstock.com/image-vector/avatar-gender-neutral-silhouette-vector-600nw-2470054311.jpg"

    var body: some View {
        AsyncImage(url: URL(string: picture.large ?? placeholderUrl)) { image in
            image
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .scaleEffect(isAnimated ? 1 : 0)
                .animation(.easeInOut(duration: 1), value: isAnimated)
                .onAppear {
                    isAnimated = true
                }

        } placeholder: {
            ProgressView()
                .tint(.white)
                .background(
                    Circle()
                        .foregroundStyle(.black.opacity(0.5))
                        .frame(width: 200, height: 200)
                )
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    ProfilePictureView(picture: .mock())
}
