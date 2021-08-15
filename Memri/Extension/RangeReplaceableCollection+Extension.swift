//
//  RangeReplaceableCollection+Extension.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import Foundation

extension RangeReplaceableCollection where Self: StringProtocol {
    var digits: Self { filter(\.isWholeNumber) }
}

