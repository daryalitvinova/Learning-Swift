//
//  ContentUnavaliableViews.swift
//  Basics
//
//  Created by Дарья Литвинова on 15.12.2025.
//

import SwiftUI

struct ContentUnavaliableViews: View {
    var body: some View {
        // просто для того, чтобы такие окна с ошибками, или отсутствием данных были едиными во всех приложениях, больше ни для чего
        //ContentUnavailableView.search(text: "abc")
        ContentUnavailableView(
            "No Internet connection",
            systemImage: "wifi.slash",
            description: Text("Please connect to the internet and try again"))
    }
}

#Preview {
    ContentUnavaliableViews()
}
