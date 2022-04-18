//
//  URLSessionNetworker.swift
//  converter
//
//  Created by Максим Кузнецов on 14.04.2022.
//

import Foundation

class URLSessionNetworker: NetworkProtocol {
    init(
        parser: Parsable = JSONDecoder(),
        cacher: CacheProtocol = LocalStorageManager()
    ) {
        self.parser = parser
        self.cacher = cacher
    }

    let parser: Parsable
    let cacher: CacheProtocol
    
    func load(from stringUrl: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: stringUrl) else {
            completion(nil)
            return
        }
        if let cache = cacher.getData(key: stringUrl) {
            completion(cache)
        } else {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                self.cacher.cacheData(for: data ?? Data(), key: stringUrl)
                completion(data)
            }.resume()
        }
    }
}
