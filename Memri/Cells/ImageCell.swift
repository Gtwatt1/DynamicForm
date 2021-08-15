//
//  ImageCell.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import UIKit
class ImageCell: UITableViewCell, BaseCell {
    
    let cellImageView = UIImageView()
    func setupCell(with details: CellDetails) {
        addSubview(cellImageView)
        cellImageView.setCustomImage(details.url ?? "")
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        cellImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true

        cellImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        let heightConstraint = cellImageView.heightAnchor.constraint(equalToConstant: CGFloat(details.heightValue))
        heightConstraint.priority = UILayoutPriority(99)
        heightConstraint.isActive = true
        cellImageView.widthAnchor.constraint(equalToConstant: CGFloat(details.widthValue)).isActive = true
    }
}
