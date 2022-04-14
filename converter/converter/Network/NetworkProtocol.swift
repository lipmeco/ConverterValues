//
//  ApiProtocol.swift
//  converter
//
//  Created by Максим Кузнецов on 14.04.2022.
//

import Foundation

protocol NetworkProtocol {
    var parser: Parsable { get }
    
    func load(from stringUrl: String, completion: @escaping (Data?) -> Void)
    func load<T: Codable>(from stringUrl: String, completion: @escaping (T?) -> Void)
}

extension NetworkProtocol {
    func load<T: Codable>(from stringUrl: String, completion: @escaping (T?) -> Void) {
        load(from: stringUrl) { (data: Data?) in
            let json: T? = try? parser.decode(T.self, from: data ?? Data())
            completion(json)
        }
    }
}
