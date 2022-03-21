//
//  EmailTextField.swift
//  TestValidation
//
//  Created by Андрей Важенов on 20.03.2022.
//

import Foundation
import UIKit

protocol ActionMailTextFieldProtocol: AnyObject {
    func typingText(text: String)
    func clenOutTextField()
}

class EmailTextField: UITextField {
    
    weak var textFieldDelegate: ActionMailTextFieldProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .white
        borderStyle = .none
        layer.cornerRadius = 10
        textColor = .black
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        placeholder = "Enter mail"
        font = UIFont(name: "Apple SD Gothic Neo", size: 20)
        tintColor = .black
        translatesAutoresizingMaskIntoConstraints = false
    }
}
extension EmailTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true}
        textFieldDelegate?.typingText(text: text)
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textFieldDelegate?.clenOutTextField()
        return true
    }
}
