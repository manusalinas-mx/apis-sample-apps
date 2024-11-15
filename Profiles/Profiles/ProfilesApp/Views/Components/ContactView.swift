//
//  ContactView.swift
//  Profiles
//
//  Created by Manuel Salinas on 11/13/24.
//
import SwiftUI

struct ContactView: View {

    let profile: Profile

    var body: some View {
        VStack {
            Label(profile.phone, systemImage: "phone.fill")
            Label(profile.email, systemImage: "mail.fill")
            Label(profile.cell, systemImage: "iphone")
        }
        .fixedSize(horizontal: false, vertical: true)
        .font(.callout).fontDesign(.rounded)
    }
}
