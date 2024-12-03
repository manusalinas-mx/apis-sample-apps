//
//  AmiiboDetailView.swift
//  AmiiboDemo
//
//  Created by Manuel Salinas on 12/3/24.
//

import SwiftUI

struct AmiiboDetailView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var closeButtonAnimated = false

    let amiibo: Amiibo

    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                AsyncImage(url: URL(string: amiibo.image)) { image in
                    image
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .scaledToFit()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                closeButtonAnimated = true
                            }

                        }

                } placeholder: {
                    ProgressView()
                }
                .onAppear {
                }

                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.largeTitle)
                            .tint(.white)
                            .shadow(color: .cyan, radius: 5)
                    }
                    .clipShape(.circle)
                    .opacity(closeButtonAnimated ? 1 : 0)
                    .animation(.default, value: closeButtonAnimated)


                    Spacer()
                }
                .padding()
            }

            Spacer()

            Text(amiibo.name)
                .font(.headline)
                .bold()
            Text(amiibo.series)
                .font(.subheadline)
                .italic()
                .foregroundColor(.secondary)
            Spacer()
            Text(amiibo.character)
                .font(.largeTitle)
                .fontDesign(.rounded)
            Spacer()
        }
        .background(Color.cyan.opacity(0.2))
    }
}

#Preview {
    AmiiboDetailView(amiibo: Amiibo.mock)
}
