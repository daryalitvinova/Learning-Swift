//
//  CommentDocumantation.swift
//  Basics
//
//  Created by Дарья Литвинова on 30.11.2025.
//

import SwiftUI

struct CommentDocumantation: View {
    
    // MARK: PROPERTIES
    
    @State private var data: [String] = ["Apples", "Oranges", "Bananas"]
    @State private var showAlert: Bool = false
    
    // MARK: BODY
    
    // DASHA - Working copy - things to do:
    /*
     1) Fix title
     2) Fix alert
     3) Fix something else
     */
    
    var body: some View {
        NavigationView { // START: NAV
            ZStack {
                // background
                Color.yellow.ignoresSafeArea()
                
                //foreground
                foregroundLayer
                    .navigationTitle("Documentation")
                    .toolbar {
                        ToolbarItem(
                            placement: .topBarTrailing,
                            content: {
                                Button("ALERT") {
                                    showAlert.toggle()
                                }
                            }
                        )
                    }
                    .alert(isPresented: $showAlert, content: {
                        getAlert(text: "This is the alert!")
                    })
            }
        } // END: NAV
    }
    
    /// This is the foreground layer that holds a scrollView.
    private var foregroundLayer: some View {
        ScrollView { // START: SCROLLV
            Text("Hello")
            ForEach(data, id: \.self) { name in
                Text(name)
                    .font(.headline)
            }
        } // END: SCROLLV
    }
    
    // MARK: FUNCTIONS
    
    /// Gets an alert with a specifie title.
    ///
    /// This function creates and returns an alert immediately. The alert will have a title based on the text parameter but it will NOT have a message.
    ///
    ///```
    /// getAlert(text: "Hi") -> Alert(title: Text("Hi"))
    /// ```
    ///
    /// - Warning: There is no additional message in this text.
    /// - Parameter text: This is the title for the alert.
    /// - Returns: Returns an alert with a title.
    private func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}

#Preview {
    CommentDocumantation()
}
