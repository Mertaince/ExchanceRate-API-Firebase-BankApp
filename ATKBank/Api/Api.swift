//
//  Api.swift
//  ATKBank
//
//  Created by Mert ATK on 27.06.2023.
//

import Foundation

class Api{
    static func api(completion: @escaping (Result<[String:Double], Error>) -> Void){
        let url = URL(string: "https://api.exchangerate-api.com/v4/latest/TRY")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
        guard let data = data else { return }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let rates = json?["rates"] as? [String: Double]{
                    completion(.success(rates))
                } else {
                    return
                }
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
