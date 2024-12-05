//
//  ContentView.swift
//  ApiTabs
//
//  Created by Manuel Salinas on 12/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Art Gallery", systemImage: "building.columns.fill") {
                MuseumDepartmentsView()
            }

            Tab("2", systemImage: "eye") {
                EmptyView()
            }

            Tab("3", systemImage: "car") {
                EmptyView()
            }

            Tab("4", systemImage: "dog") {
                EmptyView()
            }
        }
    }
}

#Preview {
    ContentView()
}
