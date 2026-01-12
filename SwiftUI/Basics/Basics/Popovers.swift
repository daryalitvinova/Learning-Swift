//
//  Popovers.swift
//  Basics
//
//  Created by Дарья Литвинова on 12.12.2025.
//

import SwiftUI

struct Popovers: View {
    @State private var showPopover: Bool = false
    @State private var feedbackOptions: [String] = ["Great!", "Okay", "Very bad"]
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Button("Provide feedback?") {
                    showPopover.toggle()
                }
                .padding(20)
                .background(.orange)
                // например, если укажем .bottom, но при этом внизу не получается показать, так как итак внизу экрана, popover подстроится и покажет это нормально не привязываясь к bottom
                // popover появляется на вью куда мы его разместили
                .popover(isPresented: $showPopover, attachmentAnchor: .point(.bottom), content: {
                    ScrollView {
                        VStack {
                            ForEach(feedbackOptions, id: \.self) { option in
                                Button(option) {
                                    
                                }
                                
                                if option != feedbackOptions.last {
                                    Divider()
                                }
                            }
                        }
                        .padding(20)
                        
                    }
                    // по умолчанию sheet
                    .presentationCompactAdaptation(.popover)
                })
            }
        }
    }
}

#Preview {
    Popovers()
}
