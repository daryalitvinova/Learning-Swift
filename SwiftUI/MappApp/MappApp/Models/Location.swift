//
//  Location.swift
//  MappApp
//
//  Created by Дарья Литвинова on 12.01.2026.
//

import Foundation
import MapKit

// Equatable для отлючения анимации

struct Location: Identifiable, Equatable {
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    // можно и через let id = UUID(), но если будет 2 объекта с одинаковыми именами, то может получится, что у них разные айди, нам это не нужно в данном случае (по сути в нормальной ситуации аqди придет извне и такой проблемы не будет, тут просто упрощаем
    var id: String {
        name + cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
