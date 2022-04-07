//
//  NetworkDataFetch.swift
//  TestValidation
//
//  Created by Андрей Важенов on 08.04.2022.
//

import Foundation

//  в данном классе парсим данные и преобразуем их
class NetworkDataFetch {
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchMail(verifiableMail: String, responce: @escaping (MailResponceModel?, Error?) -> ()) {
        NetworkRequest.shared.requestData(verifiableMail: verifiableMail) { result in
            switch result {
            case .success(let data):
                do {
                    let mail = try JSONDecoder().decode(MailResponceModel.self, from: data)
                    responce(mail, nil)
                } catch let jsonError {
                    print("Failed to decode", jsonError)
                }
            case .failure(let error):
                print("Error received : \(error.localizedDescription)")
                responce(nil, error)
            }
        }
    }
    
}
