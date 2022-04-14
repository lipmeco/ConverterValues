//
//  String+Extension.swift
//  converter
//
//  Created by Максим Кузнецов on 14.04.2022.
//

import Foundation

extension String {
    func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ssZ", dateFormatter: DateFormatter) -> Date? {
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}

extension Double {
    var rubString: String {
        return String(self) + " ₽"
    }
    
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
