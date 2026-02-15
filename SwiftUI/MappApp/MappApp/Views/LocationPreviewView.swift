//
//  LocationPreviewView.swift
//  MappApp
//
//  Created by Дарья Литвинова on 16.01.2026.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y: 65))
        //.clipped()
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            Image(viewModel.mapLocation.imageNames.first!)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
            .padding(6)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading) {
            Text(viewModel.mapLocation.name)
                .font(.title2)
                .fontWeight(.bold)
                .backgroundStyle(.brown)
            Text(viewModel.mapLocation.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            viewModel.sheetLocation = viewModel.mapLocation
        } label: {
            Text("Узнать больше")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            viewModel.nextButtonPressed()
        } label: {
            Text("Дальше")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    LocationPreviewView()
        .environmentObject(LocationsViewModel())
}
