//
//  LocationsView.swift
//  MappApp
//
//  Created by Дарья Литвинова on 13.01.2026.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject var viewModel: LocationsViewModel
    let maxWidthForIpad: CGFloat = 600
    
    var body: some View {
        ZStack {
            mapLayer
            
            VStack {
                header
                    .padding(15)
                    .frame(maxWidth: maxWidthForIpad)
                Spacer()
                
                locationPreviewStack
            }
        }
        // для item надо identifiable?, у нас такого нет, у нас не опшинал
        .sheet(
            item: $viewModel.sheetLocation,
            onDismiss: nil) { location in
                LocationDetailView(location: viewModel.mapLocation)
            }
    }
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button {
                viewModel.toggleLocationsList()
            } label: {
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .frame(maxWidth: .infinity)
                // Для этого реализуем Equatable
                    .animation(.none, value: viewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .padding()
                            .rotationEffect(Angle(degrees: viewModel.showLocationsList ? 180 : 0))
                    }
            }
            .foregroundStyle(.primary)
            .frame(height: 55)
            
            if viewModel.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        Map(position: $viewModel.mapPosition) {
            ForEach(viewModel.locations) { location in
                //Marker(location.name, coordinate: location.coordinates)
                //    .tint(.blue)
                Annotation("", coordinate: location.coordinates) {
                    //Text("HELLO")
                    LocationMapAnnotation()
                        .scaleEffect(viewModel.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            viewModel.showNextLocation(location: location)
                        }
                }
            }
        }
    }
    
    private var locationPreviewStack: some View {
        // так есть переход
        // ForEach создает несколько потенциальных вью. В каждый момент времени в иерархии есть только одно вью, когда mapLocation меняется, то старое вью удаляется, а новое добавляется
        ZStack {
            ForEach(viewModel.locations) { location in
                if viewModel.mapLocation == location {
                    LocationPreviewView()
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity)
                    // для айпада когда уменьшим ширину этого вью переход будет странным, вбю будет появляться с одного края и просто исчезать с другого, это потому что переход идет от trailing объекта к которому применяется переход и тоже самое со второй стороной
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
        
        // так перехода нет. Тут всегда 1 вью переходить не к чему
//                ZStack {
//                        LocationPreviewView()
//                            .shadow(color: .black.opacity(0.3), radius: 20)
//                            .padding()
//                            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
//                }
    }
}

#Preview {
    let viewModel = LocationsViewModel()
    LocationsView()
        .environmentObject(viewModel)
}
