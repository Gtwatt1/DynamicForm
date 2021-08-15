//
//  CellData.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import Foundation

enum CellData: Codable {
    case single(String)
    case array([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .array(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .single(x)
            return
        }
        throw MemriError.decodingFailure
    }
    
    func getSingleValue() -> String {
        if case let .single(value) = self {
            return value
        }
        return ""
    }
    
    func getArrayValue() -> [String] {
        if case let .array(value) = self {
            return value
        }
        return []
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .single(let x):
            try container.encode(x)
        case .array(let x):
            try container.encode(x)
        }
    }
}

