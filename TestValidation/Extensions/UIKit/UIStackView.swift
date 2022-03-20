//
//  UIStackView.swift
//  TestValidation
//
//  Created by Андрей Важенов on 20.03.2022.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubvies: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubvies)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
