//
//  FestivalsViewModel.swift
//  EnergyAustraliaTestApp
//
//  Created by M_AMBIN05599 on 19/04/23.
//

import Foundation
import Combine

class FestivalsViewModel: ObservableObject {
    lazy var service = WebService()
    private var publisher: AnyPublisher<[MusicFestival], Error>?
    var cancellable: AnyCancellable?
    @Published var apiStatus: APIError?
    @Published var festivalsList: [MusicFestival] = []
    var bandList: [Band] = []
    
    init() {
        getMusicFestivalList()
    }
    
    func getMusicFestivalList() {
        self.publisher = service.getFestivals()
        guard let pub = self.publisher else { return }
        
        cancellable = pub
            .sink { completion in
                if case .failure(_) = completion {
                    self.apiStatus = .invalidResponse
                }
            } receiveValue: { (festivals) in
                self.festivalsList = festivals
                self.sortAlphabetically()
                self.apiStatus = .none
                print(festivals)
            }
    }
    
    func sortAlphabetically() {
        festivalsList = festivalsList.sorted { $0.name ?? "" < $1.name ?? "" }
    }
    
    func sortBands(bands: [Band]) -> [Band] {
        return bands.sorted { $0.name ?? ""  < $1.name ?? "" }
    }
    
    func reset() {
        self.apiStatus = nil
        self.festivalsList = []
    }
}
