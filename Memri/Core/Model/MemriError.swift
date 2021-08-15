//
//  MemriError.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import Foundation

enum MemriError: Error {
    case network(String)
    case decodingFailure
    case fileNotFound
}

extension MemriError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .network(let description):
            return description
        case .decodingFailure:
            return "Error Decoding Type"
        case .fileNotFound:
            return "File not found"
        }
    }
}
