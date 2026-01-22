//
//  LocationsViewModel.swift
//  MappApp
//
//  Created by Дарья Литвинова on 13.01.2026.
//

import Foundation
import Combine
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    @Published var mapLocation: Location {
        didSet {
            self.updateMapPosition(location: mapLocation)
        }
    }
    
    @Published var mapPosition: MapCameraPosition = .automatic
    private let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationsList: Bool = false
    
    // показать описание локации
    @Published var sheetLocation: Location? = nil
    
    init() {
        // locations обязательна, так как self используется до того как хранимые свойства инициализируются
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        // тут нужно, так как иначе при инициализации остаенется мое местоположение
        self.updateMapPosition(location: self.mapLocation)
    }
    
    private func updateMapPosition(location: Location) {
        withAnimation(.easeInOut) {
            mapPosition = .region(MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
                )
            )
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            self.mapLocation = location
            self.showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: { $0.id == mapLocation.id }) else {
            print("Could not find current location")
            return
        }
        
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            
            showNextLocation(location: firstLocation)
            
            return
        }
        
        showNextLocation(location: locations[nextIndex])
    }
}
