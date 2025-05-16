//
//  HighSchoolDetail.swift
//  HighSchool-Photon
//
//  Created by Manuel Salinas on 11/12/24.
//

import SwiftUI

struct HighSchoolDetail: View {
    let highSchool: HighSchool

    var body: some View {
        ZStack {

            Color.indigo.opacity(0.2)
                .ignoresSafeArea()

                VStack {
                    Text(highSchool.name ?? "---")
                        .font(.largeTitle.bold())
                    
                    Text("Total Students: \(highSchool.totalStudents ?? "0")")
                        .font(.title3)
                        .underline()
                    
                    Divider()
                    
                    ScrollView {
                        if let overview = highSchool.overview  {
                            Text(overview)
                                .font(.title2)
                                .foregroundStyle(.indigo)
                        }
                    } // ScrollView
                }
                .padding()
                .fontDesign(.rounded)
            
        }
        .toolbarBackground(.indigo.opacity(0.2), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    HighSchoolDetail(highSchool: HighSchool.mock())
}
