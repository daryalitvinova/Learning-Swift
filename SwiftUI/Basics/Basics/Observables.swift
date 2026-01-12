//
//  Observables.swift
//  Basics
//
//  Created by Дарья Литвинова on 15.12.2025.
//

import SwiftUI
internal import Combine

// @Observable только с iOS 17

//class ObservableViewModel: ObservableObject {
@Observable class ObservableViewModel {
    /*@Published*/ var title: String = "Hello, World!"
    @ObservationIgnored var otherText: String = "This is just some other text"
}

struct Observables: View {
    
    @State/*Object*/ private var viewModel = ObservableViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            Button(viewModel.title) {
                viewModel.title = "new title!!!"
            }
            
            SomeChildView(viewModel: viewModel)
            
            SomeThirdView()
        }
        //.environmentObject(viewModel)
        .environment(viewModel)
    }
}

struct SomeChildView: View {
    /*@ObservedObject*/@Bindable var viewModel: ObservableViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "another new title"
        }
    }
}

struct SomeThirdView: View {
    //@EnvironmentObject var viewModel: ObservableViewModel
    @Environment(ObservableViewModel.self) var viewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "third new title"
        }
    }
}

#Preview {
    Observables()
}
