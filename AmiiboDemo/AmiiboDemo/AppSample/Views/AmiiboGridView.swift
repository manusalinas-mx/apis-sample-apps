//
//  AmiiboGridView.swift
//  AmiiboDemo
//
//  Created by Manuel Salinas on 11/19/24.
//

import SwiftUI

struct AmiiboGridView: View {
    let amiibos: [Amiibo]

    // ID de la tarjeta seleccionada para el rebote
    @State private var selectedItem: String? = nil

    var body: some View {
        ScrollView {
            let columns = [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]

            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(amiibos) { amiibo in
                    AmiiboCardView(item: amiibo)
                        .onTapGesture {
                            selectedItem = amiibo.id

                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                selectedItem = nil

                                // Do something
                            }
                        }
                        .scaleEffect(selectedItem ==  amiibo.id ? 0.95 : 1.0)
                        .animation(selectedItem == amiibo.id ? .spring(response: 0.3, dampingFraction: 0.6) : .default, value: selectedItem)
                }
            }
            .padding()
        }
        .scrollDismissesKeyboard(.immediately)
    }
}

#Preview {
    @Previewable @State var vm = AmiiboViewModel(service: AmiiboService())
    AmiiboGridView(amiibos: vm.amiibos)
        .task {
            await vm.fecthAmiibos(term: "mario")
        }
}
