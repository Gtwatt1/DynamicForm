//
//  CellDetails.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import Foundation

struct CellDetails: Codable {
    let type: String
    private let height: String
    private let width: String
    let url: String?
    let alignment, font: String?
    let data: CellData?
    
    var heightValue: Int {
        getSizeNumericValue(size: height)
    }
    
    var widthValue: Int {
        getSizeNumericValue(size: width)
    }
    
    private func getSizeNumericValue(size: String) -> Int {
       return Int(size.digits) ?? 0
    }
}

typealias Form = [CellDetails]
