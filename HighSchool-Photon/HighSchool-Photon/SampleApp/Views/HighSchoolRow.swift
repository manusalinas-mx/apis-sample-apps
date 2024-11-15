//
//  HighSchoolRow.swift
//  HighSchool-Photon
//
//  Created by Manuel Salinas on 11/12/24.
//

import SwiftUI

struct HighSchoolRow: View {
    let school: HighSchool

    var body: some View {
        HStack {
            Image(systemName: "house.fill")
                .font(.title2)
            
            VStack(alignment: .leading) {
                Text(school.name)
                    .font(.body.bold())
                    .foregroundStyle(.black)
                
                Text(school.id)
                    .font(.footnote)
                
            }
            .fontDesign(.rounded)
        }
        .foregroundStyle(.indigo)
    }
}
