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

    var body: some View {
        AsyncImage(url: URL(string: picture.large)) { image in
            image
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .scaleEffect(isAnimated ? 1 : 0)
                .animation(.easeInOut, value: isAnimated)
                .onAppear {
                    isAnimated = true
                }

        } placeholder: {
            ProgressView()
        }
        .frame(width: 200, height: 200)
    }
}
