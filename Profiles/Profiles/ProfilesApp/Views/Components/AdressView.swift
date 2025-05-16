//
//  AdressView.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//

import SwiftUI

struct AdressView: View {
    let profile: Profile

    var body: some View {
        Group {
            Text("\(profile.location?.street?.name ?? "- - - -") #\(profile.location?.street?.number ?? -1)")
                .fontWeight(.bold)
            Text("\(profile.location?.city ?? "- - - -") \(profile.location?.state ?? "- - - -")")
                .fontWeight(.regular)
            
            Text("\(profile.location?.country ?? "NA"), \(profile.location?.postcode ?? "NA")")
                .font(.footnote)
                .fontWeight(.thin)
        }
        .fontDesign(.rounded)
    }
}

#Preview {
    AdressView(profile: .mock())
}
