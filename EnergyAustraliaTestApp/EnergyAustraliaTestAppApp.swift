//
//  EnergyAustraliaTestAppApp.swift
//  EnergyAustraliaTestApp
//
//  Created by M_AMBIN05599 on 19/04/23.
//

import SwiftUI

@main
struct EnergyAustraliaTestAppApp: App {
    var body: some Scene {
        WindowGroup {
            FestivalsView(viewModel: FestivalsViewModel())
        }
    }
}
