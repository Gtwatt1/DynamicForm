//
//  UIView+Extension.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import UIKit

extension UIView {
    func constraintToParent(_ parent: UIView) {
        topAnchor.constraint(equalTo: parent.topAnchor, constant: 8).isActive = true
        bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -8).isActive = true
        leftAnchor.constraint(equalTo: parent.leftAnchor, constant: 8).isActive = true
        rightAnchor.constraint(equalTo: parent.rightAnchor, constant: -8).isActive = true
    }
}
