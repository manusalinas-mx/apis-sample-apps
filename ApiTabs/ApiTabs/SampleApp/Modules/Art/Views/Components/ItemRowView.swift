//
//  ItemRowView.swift
//  ApiTabs
//
//  Created by Manuel Salinas on 12/4/24.
//

import SwiftUI

struct ItemRowView: View {
    let item: ArtObject

    var body: some View {
        HStack {
            if let picUrl = item.imageUrl,
               let url = URL(string: picUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()

                } placeholder: {
                    ProgressView()

                }
                .frame(width: 50, height: 50)
                .border(.gray.opacity(0.2), width: 0.5)


            } else {
                Image(systemName: "photo.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.gray.opacity(0.3))

            }

            VStack(alignment: .leading) {
                Text(item.title.isEmpty ? "No Title" : item.title)
                    .font(.body).bold()
                    .lineLimit(2)

                if let culture = item.culture, !culture.isEmpty {
                    Text(culture)
                        .font(.caption2)
                }

                if let period = item.period, !period.isEmpty {
                    Text(period)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .fontDesign(.rounded)

            Spacer()
        }
        .listRowSeparator(.hidden)
    }
}

#Preview {
    ItemRowView(item: ArtObject.mock)
}
