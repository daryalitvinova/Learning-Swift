//
//  Pickers.swift
//  Basics
//
//  Created by Дарья Литвинова on 20.11.2025.
//

import SwiftUI

struct Pickers: View {
    // EXAMPLE 1
//    @State private var selection = "1"
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Age:")
//                Text(selection)
//            }
//            
//            Picker(
//                selection: $selection,
//                label: Text("Age picker"),
//                content: {
//                    ForEach(18..<100) { number in
//                        Text("\(number)")
//                            .font(.headline)
//                            .foregroundStyle(.purple)
//                            .tag("\(number)")
//                    }
//                })
//            .pickerStyle(WheelPickerStyle())
//        }
//    }
    
    // EXAMPLE 2
//    let filterOptions: [String] = ["Most Recent", "Most Popular", "Most Liked"]
//    // не можем использовать filterOptions[0] так как инициализируется до того как появляется self
//    @State private var selection = "Most Recent"
//    
//    var body: some View {
//        Picker(
//            selection: $selection,
//            // label не показывается, остается только кастомный все равно
//            label:
//                HStack {
//                    Text("Filter:")
//                    Text(selection)
//                }
//                .font(.headline)
//                .foregroundStyle(.pink)
//                .padding()
//                .padding(.horizontal)
//                .background(.gray.opacity(0.1)),
//            content: {
//                ForEach(filterOptions, id: \.self) { option in
//                    //Text(option)
//                    HStack {
//                        Text(option)
//                        Image(systemName: "heart.fill")
//                    }
//                    .tag(option)
//                }
//            })
//        .pickerStyle(.menu)
//    }
    
    // EXAMPLE 3
    let filterOptions: [String] = ["Most Recent", "Most Popular", "Most Liked"]
    // не можем использовать filterOptions[0] так как инициализируется до того как появляется self
    @State private var selection = "Most Recent"
    
    init() {
        // Внимание! Меняем у всего приложения
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.magenta
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        Picker(
            selection: $selection,
            label: Text("Picker"),
            content: {
                ForEach(filterOptions, id: \.self) { option in
                    Text(option)
                    .tag(option)
                }
            })
        .pickerStyle(.segmented)
    }
}

#Preview {
    Pickers()
}
