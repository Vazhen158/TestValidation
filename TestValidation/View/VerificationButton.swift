//
//  VerificationButton.swift
//  TestValidation
//
//  Created by Андрей Важенов on 20.03.2022.
//

import Foundation
import UIKit

class VerificationButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        backgroundColor = .white
        setTitle("Verification button", for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 20)
        isEnabled = false
        alpha = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
}
