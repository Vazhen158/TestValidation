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
    private let collectionView = MailCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var stackView = UIStackView(arrangedSubvies: [emailTextField,
                                                               verificationButton,
                                                               collectionView],
                                             axis: .vertical, spacing: 20)
    
    private let verificationModel = VerificationModel()
    
    
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
        view.addSubview(stackView)
        verificationButton.addTarget(self, action: #selector(verificationButtonTapped), for: .touchUpInside)
    }
    
    func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectMailDelegate = self
        emailTextField.textFieldDelegate = self
    }
    
    @objc func verificationButtonTapped() {
        guard let mail = emailTextField.text else {return}
        NetworkDataFetch.shared.fetchMail(verifiableMail: mail) { result, error in
            if error == nil {
                guard let result = result else {return}
                if result.success {
                    print("Good")
                }
            } else {
                guard let errorDescription = error?.localizedDescription else {return}
                print("error")
            }
        }
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
        verificationModel.filtredMailArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IdCell.idMailCell.rawValue, for: indexPath) as? MailCollectionViewCell
        else { return UICollectionViewCell()
            
        }
        let mailLabelText = verificationModel.filtredMailArray[indexPath.row]
        cell.cellConfigure(mailLabelText: mailLabelText)
        return cell
    }
    
    
}
extension VerificationviewController: SelectProposedMailProtocol {
    func selectProposedMail(indexParh: IndexPath) {
        guard let text = emailTextField.text else {return}
        verificationModel.getMailNmae(text: text)
        let domainMail = verificationModel.filtredMailArray[indexParh.row]
        let mailFullName = verificationModel.nameMails + domainMail
        emailTextField.text = mailFullName
        statusLabel.isValid = mailFullName.isValid()
        verificationButton.isValid = mailFullName.isValid()
        verificationModel.filtredMailArray = []
        collectionView.reloadData()
    }
    
}

extension VerificationviewController: ActionMailTextFieldProtocol {
    func typingText(text: String) {
        statusLabel.isValid = text.isValid()
        verificationButton.isValid = text.isValid()
        verificationModel.getFiltredMail(text: text)
        collectionView.reloadData()
    }
    
    func clenOutTextField() {
        statusLabel.setDefaultSettings()
        verificationButton.setDefaultSettings()
        verificationModel.filtredMailArray = []
        collectionView.reloadData()
    }
}

extension VerificationviewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
