//
//  TextCell.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import UIKit

class TextCell: UITableViewCell, BaseCell {
    let cellLabel = UILabel()
    func setupCell(with details: CellDetails) {
        addSubview(cellLabel)
        cellLabel.numberOfLines = 0
        cellLabel.text = details.data?.getSingleValue()
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.constraintToParent(self)
        let heightConstraint = cellLabel.heightAnchor.constraint(equalToConstant: CGFloat(details.heightValue))
        heightConstraint.priority = UILayoutPriority(99)
        heightConstraint.isActive = true
        let widthConstraint = cellLabel.widthAnchor.constraint(equalToConstant: CGFloat(details.widthValue))
        widthConstraint.priority = UILayoutPriority(99)
        widthConstraint.isActive = true
    }
}
