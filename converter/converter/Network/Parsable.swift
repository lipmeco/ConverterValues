//
//  Parsable.swift
//  converter
//
//  Created by Максим Кузнецов on 14.04.2022.
//

import Foundation

protocol Parsable {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}

extension JSONDecoder: Parsable { }
