//
//  FestivalsView.swift
//  EnergyAustraliaTestApp
//
//  Created by M_AMBIN05599 on 19/04/23.
//

import SwiftUI

struct FestivalsView: View {
    @ObservedObject var viewModel: FestivalsViewModel
    @State private var showAlert = false
    init(viewModel: FestivalsViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        createTitleView(title: "Music Festival")
        List {
            ForEach(viewModel.festivalsList.indices, id: \.self) { index in
                let item = viewModel.festivalsList[index]
                createFestivalView(festival: item)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .top, endPoint: .bottom)
            )
        }
        .frame(maxWidth: .infinity)
        .onChange(of: viewModel.apiStatus) { newValue in
            switch newValue {
            case .invalidResponse:
                self.showAlert = true
            default:
                self.showAlert = false
            }
        }
        .alert("OOPS.. Error occured", isPresented: $showAlert) {
            Button("Try again!!", role: .cancel) {
                self.viewModel.reset()
                self.viewModel.getMusicFestivalList()
            }
        }
    }
    
    
    /// Create Title View
    /// - Parameter title: title string
    @ViewBuilder
    func createTitleView(title: String) -> some View {
        VStack {
            Text(title)
                .font(.title)
                .frame(maxWidth: .infinity)
        }
    }
    
    
    /// Create festival View
    /// - Parameter festival: MusicFestival type object
    @ViewBuilder
    func createFestivalView(festival: MusicFestival) -> some View {
        VStack(alignment: .leading) {
            if let name = festival.name {
                Text(name)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray)
                
            }
            if let bands = festival.bands {
                createBandView(bands: bands)
                    .frame(alignment: .leading)
            }
        }
    }
    
   
    /// Cretes Band view
    /// - Parameter bands: Array of Band object
    @ViewBuilder
    func createBandView(bands: [Band]) -> some View {
        var sortedBand = viewModel.sortBands(bands: bands)
        ForEach(sortedBand.indices, id: \.self) { index in
            let band = sortedBand[index]
            if let bandName = band.name {
                VStack(alignment: .leading) {
                    HStack {
                        Text("BandName:")
                            .font(.caption)
                            .padding(.leading, 8.0)
                        Text(bandName)
                            .font(.subheadline)
                        Spacer()
                    }
                    HStack {
                        Text("RecordLabel:")
                            .font(.caption)
                            .padding(.leading, 8.0)
                        if let label = band.recordLabel, label != "" {
                            Text(band.recordLabel ?? "N/A")
                                .font(.subheadline)
                        }
                        if let emptyLabel = band.recordLabel, emptyLabel == "" {
                            Text("N/A")
                                .font(.subheadline)
                        }
                        Spacer()
                    }
                }
                .frame(height: 50, alignment: .leading)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 2, height: 2))
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
        }
    }
}

struct FestivalsView_Previews: PreviewProvider {
    static var previews: some View {
        FestivalsView(viewModel: FestivalsViewModel())
    }
}
