//
//  Date+Format.swift
//  FileManager
//
//  Created by Saurav Nagpal on 08/01/24.
//

import Foundation

public enum DateStringFormat: String {
    case yyyymmmdd = "YYYY-MMM-DD"
}

extension Date {
    static func formatTimestampInStringFormat(_ timeInterval: TimeInterval, format: DateStringFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: Date(timeIntervalSince1970: timeInterval))
    }
}
