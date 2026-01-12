//
//  DatePickers.swift
//  Basics
//
//  Created by Дарья Литвинова on 21.11.2025.
//

import SwiftUI

struct DatePickers: View {
    @State private var selectedDate: Date = Date()
    
    private let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    
    private let endingDate: Date = Date()
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "ru")
        return formatter
    }
    
    var body: some View {
        VStack {
            
            Text("Selected date:")
            Text(dateFormatter.string(from: selectedDate))
            
            //DatePicker("Select a date", selection: $selectedDate)
            //DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date])
            DatePicker("Select a date", selection:  $selectedDate, in: startingDate...endingDate, displayedComponents: [.date])
                .environment(\.locale, Locale(identifier: "ru"))
                .tint(.custom)
                .datePickerStyle(
                    CompactDatePickerStyle()
                    //WheelDatePickerStyle()
                    //GraphicalDatePickerStyle()
                )
        }
    }
}

#Preview {
    DatePickers()
}
