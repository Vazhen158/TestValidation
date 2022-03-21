//
//  StatusLabel.swift
//  TestValidation
//
//  Created by Андрей Важенов on 20.03.2022.
//

import Foundation
import UIKit

class StatusLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        text = "Check your email"
        textColor = .white
        font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        adjustsFontSizeToFitWidth = true // авто размер шрифта по ширине
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
