//
//  LazyVGrids.swift
//  Basics
//
//  Created by Дарья Литвинова on 12.11.2025.
//

import SwiftUI

struct LazyVGrids: View {
    private let columns = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0.7984681835)))
                .frame(maxWidth: .infinity, idealHeight: 200)
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders],
            ) {
                Section(
                    content: {
                        ForEach(0..<12) { index in
                            Rectangle()
                                .fill(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0.6111216012)))
                                .frame(height: 150)
                        }
                    },
                    header: {
                        Text("Section 1")
                            .foregroundStyle(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0.7042815332)))
                            .padding()
                    })
                Section(
                    content: {
                        ForEach(0..<12) { index in
                            Rectangle()
                                .fill(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0.7672299849)))
                                .frame(height: 150)
                        }
                    },
                    header: {
                        Text("Section 2")
                            .foregroundStyle(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0.8741030967)))
                            .padding()
                    })
            }
        }
    }
}

#Preview {
    LazyVGrids()
}
