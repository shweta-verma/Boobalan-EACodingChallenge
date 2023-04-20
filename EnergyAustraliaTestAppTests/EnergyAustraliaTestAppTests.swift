//
//  EnergyAustraliaTestAppTests.swift
//  EnergyAustraliaTestAppTests
//
//  Created by M_AMBIN05599 on 19/04/23.
//

import XCTest
@testable import EnergyAustraliaTestApp

final class EnergyAustraliaTestAppTests: XCTestCase {

    func test_reset() throws {
        let view = FestivalsView(viewModel: FestivalsViewModel())
        view.viewModel.reset()
        //After reset, check the apistatus and list array
        XCTAssertNil(view.viewModel.apiStatus)
        XCTAssertTrue(view.viewModel.festivalsList == [])
    }

    func test_sortBands() {
        let bands = [Band(id: UUID(), name: "Propeller", recordLabel: "Pacific Records"),
                     Band(id: UUID(), name: "Critter Girls", recordLabel: "ACR")]
        let view = FestivalsView(viewModel: FestivalsViewModel())
        let result = view.viewModel.sortBands(bands: bands)
        //Check the first element of sorted array
        XCTAssertEqual(result.first?.name, "Critter Girls")
    }
}
