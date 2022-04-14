//
//  ApiProtocol.swift
//  converter
//
//  Created by Максим Кузнецов on 14.04.2022.
//

import Foundation

protocol NetworkProtocol {
    func load(from stringUrl: String, completion: @escaping (Data?) -> Void)
    
    func load<T: Codable>(from stringUrl: String, completion: @escaping (T?) -> Void)
}
