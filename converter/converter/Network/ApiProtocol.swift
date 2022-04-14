//
//  ApiProtocol.swift
//  converter
//
//  Created by Максим Кузнецов on 14.04.2022.
//

import Foundation

protocol ApiProtocol {
    func lastCurrencies(completion: @escaping (ParsedCurrency) -> Void)
    func inDateCurrencies(for date: Date, completion: @escaping (ParsedCurrency?) -> Void)
}
