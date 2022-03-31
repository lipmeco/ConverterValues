//
//  Currency.swift
//  converter
//
//  Created by Максим Кузнецов on 27.03.2022.
//

import Foundation

struct Currency {
    let name: String
    let cost: Double
}

extension Double {
    var string: String {
        return String(self) + " ₽"
    }
}
