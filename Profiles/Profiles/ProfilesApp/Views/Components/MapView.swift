//
//  MapView.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    let location: Location

    var body: some View {

        Map {
            Marker("Me", coordinate: CLLocationCoordinate2D(latitude: location.coordinates.lat, longitude: location.coordinates.long))
        }
        .disabled(true)
        .frame(maxWidth: .infinity, maxHeight: 220)
    }
}
