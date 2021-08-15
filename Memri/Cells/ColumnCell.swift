//
//  ColumnCell.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import UIKit

class ColumnCell: MultipleItemCell, BaseCell {
    func setupCell(with details: CellDetails) {
        configureView(axis: .vertical, with: details)
    }
}
