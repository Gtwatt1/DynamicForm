//
//  MultipleItemCell.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import UIKit

class MultipleItemCell: UITableViewCell {
    let stackView = UIStackView()
    func configureView(axis: NSLayoutConstraint.Axis, with details: CellDetails){
        stackView.axis = axis
        stackView.alignment = .leading
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        if let rowData = details.data {
            for item in rowData.getArrayValue() {
                let imageView = UIImageView()
                imageView.contentMode = .scaleAspectFit
                imageView.setCustomImage(item)
                stackView.addArrangedSubview(imageView)
            }
        }
        stackView.constraintToParent(self)
        let heightConstraint = stackView.heightAnchor.constraint(equalToConstant: CGFloat(details.heightValue))
        heightConstraint.priority = UILayoutPriority(99)
        heightConstraint.isActive = true
        let widthConstraint = stackView.widthAnchor.constraint(equalToConstant: CGFloat(details.widthValue))
        widthConstraint.priority = UILayoutPriority(99)
        widthConstraint.isActive = true
    }
}
