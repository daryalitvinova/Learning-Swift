//
//  LocationsListView.swift
//  MappApp
//
//  Created by Дарья Литвинова on 15.01.2026.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject var viewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button {
                    viewModel.showNextLocation(location: location)
                } label: { listRowView(location: location)
                }
                .padding(4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}

extension LocationsListView {
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            VStack (alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}
