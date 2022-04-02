//
//  VerificationModel.swift
//  TestValidation
//
//  Created by Андрей Важенов on 02.04.2022.
//

import Foundation


class VerificationModel {
    private let mailsArray = ["@gmail.com", "@yandex.ru", "@yahoo.com", "@mail.ru"]
    
    public var nameMails = String()
    
    public var filtredMailArray = [String]()
    
    private func filtringMails (text: String) {
        var domainMail = String()
        guard let firstIndex = text.firstIndex(of: "@") else {return}
        let endIndex = text.index(before: text.endIndex)
        let range = text[firstIndex...endIndex]
        domainMail = String(range)
        filtredMailArray = []
        
        mailsArray.forEach { mail in
            if mail.contains(domainMail) {
                if !filtredMailArray.contains(mail) {
                    filtredMailArray.append(mail)
                }
                
            }
        }
        
    }
    
    public func getFiltredMail(text: String) {
        filtringMails(text: text)
    }
}
