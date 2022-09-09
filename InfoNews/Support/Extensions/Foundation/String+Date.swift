//
//  String+Date.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 09/09/22.
//

import Foundation

extension String {
    
    func toDate() -> Date? {
        let parseFormat = ISO8601DateFormatter()
        return parseFormat.date(from: self)
    }
    
    func formatToDate() -> String {
        return self.toDate()?.toString() ?? "n/d"
    }
}

extension Date {
    
    static var dayTimeFormat: String = "dd/MM/yyyy, HH:mm"
    
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = Date.dayTimeFormat
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: self)
    }
}
