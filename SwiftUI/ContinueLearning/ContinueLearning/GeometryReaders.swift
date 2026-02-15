//
//  GeometryReader.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 26.01.2026.
//

import SwiftUI

struct GeometryReaders: View {
    var body: some View {
//        // но надо осторожно использовать, так как все эти вычисления нагружают приложениеы
//        GeometryReader { geometry in
//            HStack(spacing: 0) {
//                Rectangle()
//                    .fill(.red)
//                // проблема в том, что если повернуть устройство, то ширина устройства то останется предыдущей, и никаких 2/3 мы уже не получим
//                //    .frame(width: UIScreen.main.bounds.width * 0.6666)
//                    .frame(width: geometry.size.width * 0.6666)
//                
//                Rectangle()
//                    .fill(.blue)
//            }
//            .ignoresSafeArea()
//        }
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                // хотим добавить небольшое вращение, когда элемент у границы экрана, для этого нужен GeometryReader, он знает где начинается и заканчивается элемент
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(Angle(degrees: 30 * getPersentage(geo: geometry)), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
                
            }
        })
    }
    
    private func getPersentage(geo: GeometryProxy) -> Double {
        // geo.size.width / 2 это в локальной СК
        // чтобы это сделать надо обернуть ScrollView в еще один GeometryReader
        let maxDistance = UIScreen.main.bounds.width / 2
        
        let currentX = geo.frame(in: .global).midX // середина прямоугольника
        
        return Double(1 - (currentX / maxDistance))
    }
}

#Preview {
    GeometryReaders()
}
