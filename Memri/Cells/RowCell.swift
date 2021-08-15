//
//  RowCell.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import UIKit

class RowCell: MultipleItemCell, BaseCell {
    func setupCell(with details: CellDetails) {
        configureView(axis: .horizontal, with: details)
    }
    
}

