//
//  MusicFestival.swift
//  EnergyAustraliaTestApp
//
//  Created by M_AMBIN05599 on 19/04/23.
//

import Foundation

struct MusicFestival: Identifiable, Codable  {
    var id: UUID?
    var name: String?
    var bands: [Band]?
}

struct Band: Identifiable, Codable {
    var id: UUID?
    var name: String?
    var recordLabel: String?
}
