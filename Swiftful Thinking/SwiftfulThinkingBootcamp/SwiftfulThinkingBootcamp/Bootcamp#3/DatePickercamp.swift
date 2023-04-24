//
//  DatePickercamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/26.
//

import SwiftUI

struct DatePickercamp: View {
    
    @State var selectedDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2022)) ?? Date()
    
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        //formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("Selected date is:")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            
            DatePicker("Select a Date", selection: $selectedDate, displayedComponents: [.date])
                .tint(.cyan)
                .datePickerStyle(.graphical)
            
            DatePicker("Select a Date", selection: $selectedDate,displayedComponents: [.date])
                .tint(.cyan)
                .datePickerStyle(.wheel)
            
            DatePicker("Select a Date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date])
                .tint(.cyan)
                .datePickerStyle(.compact)
        }
    }
}

struct DatePickercamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickercamp()
    }
}
