//
//  DataMapper.dart.swift
//  combineTrain
//
//  Created by Apple on 17/02/2025.
//

import Foundation

class DataMapper {
    static func toDictionary<T: Encodable>(_ model: T) -> [String: Any]? {
        guard let data = try? JSONEncoder().encode(model),
              let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            return nil
        }
        return dictionary
    }
}
