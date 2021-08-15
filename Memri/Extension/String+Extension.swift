//
//  String+Extension.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import Foundation

extension String {
    
    func fileExtension() -> String {
        return URL(fileURLWithPath: self).pathExtension
    }
}
