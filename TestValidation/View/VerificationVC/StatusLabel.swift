//
//  StatusLabel.swift
//  TestValidation
//
//  Created by Андрей Важенов on 20.03.2022.
//

import Foundation
import UIKit

class StatusLabel: UILabel {
    
    public var isValid = false { // свойство отслеживает подходит ли введенный текст под нужные параметры
        didSet {
            if self.isValid {
                setValidSettings()
            } else {
               setNotValidSettings()
            }
        }
    }
    
    
    
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
    
    private func setNotValidSettings() { // метод отображает в лейбле информацию об ошибке
        text = "Mail is not valid. Exampel: named@domain.ru"
        textColor = .red
    }
    
    private func setValidSettings() {
        text = "Mail is  valid."
        textColor = .green
    }
    
    public func setDefaultSettings() { // метод сбрасывает надпись в лейбле к дефолтным настройкам
        configure()
    }
}
