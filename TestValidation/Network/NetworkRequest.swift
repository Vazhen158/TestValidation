//
//  NetworkRequest.swift
//  TestValidation
//
//  Created by Андрей Важенов on 07.04.2022.
//

import Foundation

struct NetworkRequest {
    
    static let shared = NetworkRequest()
    
    private init() {
        
    }
    func requestData(verifiableMail: String, complition: @escaping(Result<Data, Error>) -> Void) {
        let urlString = "https://api.kickbox.com/v2/verify?email=\(verifiableMail)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error = error { // проверяем, если ошибка то выходим
                    complition(.failure(error))
                    return
                }
                guard let data = data else {return}
                complition(.success(data))
            }
        }.resume()
    }
    
}
