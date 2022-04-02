//
//  String + Extensions.swift
//  TestValidation
//
//  Created by Андрей Важенов on 03.04.2022.
//

import Foundation

extension String {
    
    func isValid() -> Bool { // метод проверяет строку на соответствие через регулярное мат.выражение
        let format = "SELF MATCHES %@"
        let regEx = "[a-zA-Z0-9._]+@[a-zA-Z]+\\.[a-zA-Z]{2,}"
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
}
