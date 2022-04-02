//
//  MailCollectionViewCell.swift
//  TestValidation
//
//  Created by Андрей Важенов on 21.03.2022.
//

import Foundation
import UIKit


class MailCollectionViewCell: UICollectionViewCell {
    
    private let domainLabel: UILabel = {
        let label = UILabel()
        label.text = "@gmail.com"
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 10
        addSubview(domainLabel)
    }
    
    private func configure(mailLabelText: String) { // добавляет текст в лейбл
        domainLabel.text = mailLabelText
    }
    public func cellConfigure(mailLabelText: String) { //глобальная функция для возможности взаимодействия с vc  и передачи данных в лейбл
        configure(mailLabelText: mailLabelText)
    }
    
}
extension MailCollectionViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            domainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            domainLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
