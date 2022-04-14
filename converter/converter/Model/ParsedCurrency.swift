//
//  ParsedCurrency.swift
//  converter
//
//  Created by Максим Кузнецов on 02.04.2022.
//

import Foundation

struct ParsedCurrency: Codable {
    let date: String
    let previousDate: String
    let previousURL: String
    let timestamp: String
    let valute: [String: Valutes]
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case previousDate = "PreviousDate"
        case previousURL = "PreviousURL"
        case timestamp = "Timestamp"
        case valute = "Valute"
    }
}

struct Valutes: Codable {
    let id: String
    let numCode: String
    let charCode: String
    let nominal: Int
    let name: String
    let value: Double
    let previous: Double

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case numCode = "NumCode"
        case charCode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case previous = "Previous"
    }
}
