//
//  AmiiboCardView.swift
//  AmiiboDemo
//
//  Created by Manuel Salinas on 11/19/24.
//

import SwiftUI

struct AmiiboCardView: View {
    let item: Amiibo

    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: item.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 250)

            // Name
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.title2.bold())
                    .foregroundStyle(.white)

                Text(item.series)
                    .font(.body)
                    .foregroundStyle(.yellow)
            }
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity)
            .fontDesign(.rounded)
            .background(Color.black.opacity(0.5))
        }
        .border(Color.black.opacity(0.1), width: 1.5)
        .background(.white)
        .cornerRadius(5)
        .scrollTransition { content, phase in
            content
                .scaleEffect(phase.isIdentity ? 1 : 0.9)
                .offset(x: phase.isIdentity ? 0 : 10)
        }
    }
}

#Preview {
    AmiiboCardView(item: .mock)
        .frame(maxWidth: 250)
}
