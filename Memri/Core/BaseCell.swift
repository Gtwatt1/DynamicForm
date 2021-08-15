//
//  BaseCell.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import UIKit

protocol BaseCell: UITableViewCell {
    func setupCell(with details: CellDetails)
}
