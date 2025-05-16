//
//  FullNameView.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//

import SwiftUI

struct FullNameView: View {
    let profile: Profile

    var body: some View {
        VStack {
            Text(profile.name?.title ?? "- - - -")
                .font(.callout)
            
            Text(profile.name?.fullname ?? "- - - -")
                .font(.largeTitle).fontDesign(.rounded).fontWeight(.bold)
            
            Text(profile.gender  ?? "none")
                .foregroundStyle(.gray)
            
            Divider()
        }
    }
}

#Preview {
    FullNameView(profile: .mock())
}
