//
//  CacheWorker.swift
//  converter
//
//  Created by Максим Кузнецов on 18.04.2022.
//

import Foundation

class LocalStorageManager: CacheProtocol {
    func cacheData(data: Data, key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func getData(key: String) -> Data? {
        UserDefaults.standard.data(forKey: key)
    }
}
