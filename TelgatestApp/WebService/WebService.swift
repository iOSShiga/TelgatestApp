//
//  WebService.swift
//  TelgatestApp
//
//  Created by Suresh Shiga on 02/08/21.
//

import Foundation

enum WebServiceError: Error {
    case inValidUrl
    case unableToComplete
    case invalidResponse
    case invalidData
    case invalidModal
}


class Webservice {

  class func postUserData(username:String, emailaddress:String, completion: @escaping (Result<[User], WebServiceError>) -> ()) {
        guard let url = URL(string: "https://telgatech.com/foo/create_user") else {
            return completion(.failure(WebServiceError.inValidUrl))
        }
        let body:[String: String] = ["username": username, "emailaddress":emailaddress]
        let finalBody = try! JSONSerialization.data(withJSONObject: body, options: [])
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                completion(.failure(.unableToComplete))
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return completion(.failure(.invalidResponse))
            }

            guard let data = data else {
                return completion(.failure(.invalidData))
            }

            do{
                let decoder = JSONDecoder()

                let userData = try decoder.decode([User].self, from: data)
                completion(.success(userData))

            } catch  {
                print(error)
                completion(.failure(.invalidModal))
            }

        }.resume()
        
    }
}
