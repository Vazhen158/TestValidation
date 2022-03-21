//
//  ViewController.swift
//  TestValidation
//
//  Created by Андрей Важенов on 19.03.2022.
//

import UIKit

class VerificationviewController: UIViewController {

    
    private let statusLabel = StatusLabel()
    private let emailTextField = EmailTextField()
    private let verificationButton = VerificationButton()
    private let collectionView = MailCollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setDelegates()
        setConstraints()
        configureBackground()
    }

    func setupView() {
        view.addSubview(statusLabel)
        view.addSubview(emailTextField)
    }
    
    func setDelegates() {
        collectionView.dataSource = self
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
extension VerificationviewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IdCell.idMailCell.rawValue, for: indexPath) as? MailCollectionViewCell
        else {return UICollectionViewCell()}
        return cell
    }
    
    
}

extension VerificationviewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
}
