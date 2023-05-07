//
//  Formatters.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.locale = Locale.current
    formatter.dateFormat = "HH:mm"
    return formatter
}

var birthDateFormater: DateFormatter {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "tr_TR")
    formatter.dateFormat = "dd MMMM yyyy"
    return formatter
}

var dateSelectionFormatter: DateFormatter {
    let formatter = DateFormatter()
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "tr_TR")
    formatter.calendar = calendar
    formatter.dateFormat = "MMM d"
    return formatter
}

var durationFormatter: DateComponentsFormatter {
    let formatter = DateComponentsFormatter()
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "tr_TR")
    formatter.calendar = calendar
    formatter.unitsStyle = .short
    formatter.allowedUnits = [.hour, .minute]
    return formatter
}

var durationFormatterFull: DateComponentsFormatter {
    let formatter = DateComponentsFormatter()
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "tr_TR")
    formatter.calendar = calendar
    formatter.unitsStyle = .full
    formatter.allowedUnits = [.hour, .minute]
    return formatter
}
