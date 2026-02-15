//
//  AccessibilityVioceOver.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 14.02.2026.
//

import SwiftUI

// VoiceOver хорошо работает на нативных компонентах, на кастомных нужно настраивать самому

struct AccessibilityVioceOver: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Volume", isOn: $isActive)
                    
                    HStack {
                        Text("Volume")
                        Spacer()
                        Text(isActive ? "ON" : "OFF")
                        // если хотим отзвучивать что-то отличное от того, что показывается
                            .accessibilityHidden(true)
                    }
                    .onTapGesture {
                        isActive.toggle()
                    }
                    // без этого озвучивается только Volume, с ним Volume OFF
                    .accessibilityElement(children: .combine)
                    // так добавится озвучивание, что это кнопка
                    .accessibilityAddTraits(.isButton)
                    // если хотим отзвучивать что-то отличное от того, что показывается
                    .accessibilityValue(isActive ? "is on" : "is off")
                    // тоже добавится этот текст
                    .accessibilityHint("Double tap to toggle setting.")
                    .accessibilityAction {
                        isActive.toggle()
                    }
                } header: {
                     Text("PREFERENCES")
                }
                
                Section {
                    Button("Favourites") { }
                    // теперь не считается кнопкой при озвучивании
                        .accessibilityRemoveTraits(.isButton)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                    // описание содержимого
                    .accessibilityLabel("Favourites")
                    
                    Text("Favourites")
                        .accessibilityAddTraits(.isButton)
                        .onTapGesture {
                            
                        }
                } header: {
                    Text("APPLICATION")
                }
                
                Section {
                    Text("CONTENT")
                        .font(.caption)
                    // в этой секции нет хэдера, теперь это будет считаться им
                        .accessibilityAddTraits(.isHeader)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(0..<10) { x in
                                VStack {
                                    Image("steve-jobs")
                                    
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .scaledToFill()
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                    
                                    Text("Item \(x)")
                                }
                                
                                .onTapGesture {
                                    
                                }
                                .accessibilityElement(children: .combine)
                                .accessibilityAddTraits(.isButton)
                                .accessibilityLabel("Item \(x). Image of Steve Jobs")
                                .accessibilityHint("Double tap to open.")
                                .accessibilityAction {
                                    
                                }
                            }
                            
                        }
                    }
                    
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    AccessibilityVioceOver()
}
