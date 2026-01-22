//
//  LocationDetailView.swift
//  MappApp
//
//  Created by Дарья Литвинова on 20.01.2026.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    let location: Location
    
    @EnvironmentObject var viewModel: LocationsViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    
                    Divider()
                    
                    descriptionSection
                    
                    Divider()
                    
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
    }
}

extension LocationDetailView {
    
    
    private var imageSection: some View {
        /*ForEach(location.imageNames, id: \.self) {
         Image($0)
         .resizable()
         .scaledToFill()
         // когда фото больше чем экран в ширину, получается некрасивый эффект в нахлест соседних фото при перепистывании, уходим от этого
         .frame(width: UIScreen.main.bounds.width)
         .clipped()
         }*/
        TabView {
            // c viewModel.mapLocation.imageNames падает с ошибкой Thread 1: EXC_BAD_ACCESS
            // если верить чату гпт
            //TabView в .page режиме создаёт lazy loading страниц.
            //SwiftUI попытался строить страницу, когда viewModel.mapLocation ещё менялся, и при этом ForEach внутри TabView обращается к старой mapLocation.
            //Результат → EXC_BAD_ACCESS, потому что объект был удалён/заменён, а TabView пытался получить доступ к старым view.
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                // когда фото больше чем экран в ширину, получается некрасивый эффект в нахлест соседних фото при перепистывании, уходим от этого
                //.frame(width: geo.size.width)
                    //.frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                
                // вот это решил проблему выше
                    .containerRelativeFrame(.horizontal)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(.page)
        .overlay(backButton, alignment: .topLeading)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.mapLocation.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(viewModel.mapLocation.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.mapLocation.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            if let url = URL(string: viewModel.mapLocation.link) {
                Link("Прочитать больше на Википедии", destination: url)
                    .font(.headline)
                    .foregroundStyle(.blue)
            }
        }
    }
    
    private var mapLayer: some View {
        Map(position: .constant(viewModel.mapPosition)) {
            Annotation("", coordinate: viewModel.mapLocation.coordinates) {
                LocationMapAnnotation()
                    .shadow(radius: 10)
            }
        }
        // чтобы нельзя было двигать
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var backButton: some View {
        Button {
            viewModel.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundStyle(.black)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 10)
                .padding(.vertical, 60)
                .padding(.horizontal, 20)
            
        }

    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}
