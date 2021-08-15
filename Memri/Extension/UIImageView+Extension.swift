//
//  UIImageView+Extension.swift
//  Memri
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import UIKit
import SVGKit

extension UIImageView {
    
    func setCustomImage(_ urlString: String) {
        DispatchQueue.global().async { [weak self] in
            if let url = URL(string: urlString),
               let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    if urlString.fileExtension() == "svg" {
                        let svgImage = SVGKImage(data: data)
                        self?.image = svgImage?.uiImage
                    } else {
                        self?.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
