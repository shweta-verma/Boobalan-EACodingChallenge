//
//  WebService.swift
//  EnergyAustraliaTestApp
//
//  Created by M_AMBIN05599 on 19/04/23.
//

import Foundation
import Combine

//let baseURL = "https://eacp.energyaustralia.com.au/codingtest/api/v1/festivals"

enum APIError: Error, Hashable {
    case invalidBody
    case invalidEndpoint
    case invalidURL
    case emptyData
    case invalidJSON
    case invalidResponse
    case statusCode(Int)
}

class WebService {
    //Getting the baseURL from info.plist
    let baseURL = Bundle.main.infoDictionary?["BASE_URL"]
    func getFestivals() -> AnyPublisher<[MusicFestival], Error> {
        guard let festiveURL = URL(string: baseURL as! String) else { fatalError("The URL is broken")}

        return URLSession.shared.dataTaskPublisher(for: festiveURL)
            .map { $0.data }
            .decode(type: [MusicFestival].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
