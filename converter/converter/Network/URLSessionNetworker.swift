//
//  URLSessionNetworker.swift
//  converter
//
//  Created by Максим Кузнецов on 14.04.2022.
//

import Foundation

class URLSessionNetworker: NetworkProtocol {
    init(parser: Parsable = JSONDecoder()) {
        self.parser = parser
    }
    
    let parser: Parsable
    
    func load(from stringUrl: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: stringUrl) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            completion(data)
        }.resume()
    }
}
