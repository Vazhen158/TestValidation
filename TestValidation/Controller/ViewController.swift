//
//  ViewController.swift
//  TestValidation
//
//  Created by Андрей Важенов on 19.03.2022.
//

import UIKit

class ViewController: UIViewController {

    
    private let statusLabel = StatusLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setDelegates()
        setConstraints()
        configureBackground()
    }

    func setupView() {
        view.addSubview(statusLabel)
    }
    
    func setDelegates() {
        
    }
    
    func configureBackground() {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
      }


}

extension ViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        
        
        ])
    }
}
