//
//  ApiManager.swift
//  converter
//
//  Created by Максим Кузнецов on 14.04.2022.
//

import Foundation

class ApiManager: ApiProtocol {

    private let networkManager: NetworkProtocol
    
    private enum Constants {
        static let lastCurrencies = "https://www.cbr-xml-daily.ru/daily_json.js"
        static let archivePath = "https://www.cbr-xml-daily.ru/archive/"
        static let endpointName = "/daily_json.js"
        static let dateFormat = "YYYY/MM/dd"
    }
    
    init(networkManager: NetworkProtocol = URLSessionNetworker()) {
        self.networkManager = networkManager
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormat
        return dateFormatter
    }()
    
    // MARK: ApiProtocol implementation
    func lastCurrencies(completion: @escaping (ParsedCurrency) -> Void) {
        networkManager.load(
            from: Constants.lastCurrencies
        ) { (model: ParsedCurrency?) in
            guard let model = model else { return }
                completion(model)
        }
    }
    
    func inDateCurrencies(for date: Date, completion: @escaping (ParsedCurrency?) -> Void) {
        let url = urlForDate(date: date)
        networkManager.load(
            from: url
        ) { (model: ParsedCurrency?) in
            completion(model)
        }
    }
    
    private func urlForDate(date: Date) -> String {
        Constants.archivePath + dateFormatter.string(from: date) + Constants.endpointName
    }
}
