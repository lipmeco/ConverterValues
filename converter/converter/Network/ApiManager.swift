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
        static let host = "https://www.cbr-xml-daily.ru"
        static let endpointName = "daily_json.js"
        static let archive = "archive"
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
        let url = urlForLastDay()
        networkManager.load(
            from: url
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
        guard let url = URL(string: Constants.host)?
                .appendingPathComponent(Constants.archive)
                .appendingPathComponent(dateFormatter.string(from: date))
                .appendingPathComponent(Constants.endpointName) else { return "" }
        
        return url.absoluteString
    }
    
    private func urlForLastDay() -> String {
        guard let url = URL(string: Constants.host)?
                .appendingPathComponent(Constants.endpointName) else { return "" }
        
        return url.absoluteString
    }
}
