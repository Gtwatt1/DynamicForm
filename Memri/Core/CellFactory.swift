//
//  CellFactory.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import Foundation

struct CellFactory {
    
    private let cells: [String: BaseCell] = ["Image": ImageCell(),
                 "Text": TextCell(),
                 "Row": RowCell(),
                 "Column": ColumnCell(),
                 "Stack": StackCell()]
    
    func getCell(cellType: String) -> BaseCell {
        cells[cellType] ?? TextCell()
    }
}
