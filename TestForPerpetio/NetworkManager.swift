//
//  NetworkManager.swift
//  TestForPerpetio
//
//  Created by Nazar Babyak on 17.02.2022.
//


import Foundation

enum NetworkManagerError: Error {
    case requestError(String)
    case responseError
    case statusCodeError(String)
    case noData
}

class NetworkManager {
   
    func downloadData(
        fromURL url: URL,
        completionHandler: @escaping (Data) -> (),
        errorHandler: @escaping (Error) -> ()
    ) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                errorHandler(NetworkManagerError.requestError(String(describing: error)))
                return
            }
            
            guard let response = response as? HTTPURLResponse  else {
                errorHandler(NetworkManagerError.responseError)
                return
            }
            
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                errorHandler(
                    NetworkManagerError.statusCodeError("Status code should be 2**, but it \(response.statusCode)")
                )
                return
            }
            
            guard let data = data else {
                errorHandler(NetworkManagerError.noData)
                return
            }
            
            completionHandler(data)
        }.resume()
    }
}
