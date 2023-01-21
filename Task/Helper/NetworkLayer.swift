//
//  NetworkLayer.swift
//  Task
//
//  Created by Apple on 21/01/2023.
//

import Foundation
struct  NetworkLayer{
    func postRequest<T: Codable>(url: String, success: @escaping(T) -> (), onError: @escaping(String) -> ()){
        guard let url = URL(string: url) else { return  }
        let request = URLRequest(url: url)
               URLSession.shared.dataTask(with: request) { data, response, error in
                   if let data = data {
                       do {
                           let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                           success(decodedResponse)
                           return
                       } catch {
                           print(error)
                       }
                   }
                   print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
               }
               .resume()
    }
}
