//
//  ItemDetailView.swift
//  ApiTabs
//
//  Created by Manuel Salinas on 12/5/24.
//

import SwiftUI

struct ItemDetailView: View {
    let picUrl: URL
    var body: some View {
        VStack {
            AsyncImage(url: picUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.black)
    }
}

#Preview {
    ItemDetailView(picUrl: URL(string: "https://i0.wp.com/la-lista.com/wp-content/uploads/2024/04/La-obra-maestra-mas-decepcionante-del-mundo.jpg")!)
}
